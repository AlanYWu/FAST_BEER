function [S,t,f,Serr]=mtspecgramc(data,movingwin,params)
%http://chronux.org/chronuxFiles/Documentation/chronux/spectral_analysis/continuous/mtspecgramc.html#_top
%来自论文中推荐的Chronux平台
if nargin < 2; error('Need data and window parameters'); end;
if nargin < 3; params=[]; end;
 function [tapers,pad,Fs,fpass,err,trialave,params]=getparams(params)
   if ~isfield(params,'tapers') || isempty(params.tapers);  %If the tapers don't exist
     display('tapers unspecified, defaulting to params.tapers=[3 5]');
      params.tapers=[3 5];
 end;
 if ~isempty(params) && length(params.tapers)==3 
    % Compute timebandwidth product
     TW = params.tapers(2)*params.tapers(1);
     % Compute number of tapers
     K  = floor(2*TW - params.tapers(3));
     params.tapers = [TW  K];
 end
 
 if ~isfield(params,'pad') || isempty(params.pad);
     params.pad=0;
 end;
if ~isfield(params,'Fs') || isempty(params.Fs);
     params.Fs=1;
 end;
if ~isfield(params,'fpass') || isempty(params.fpass);
     params.fpass=[0 params.Fs/2];
 end;
 if ~isfield(params,'err') || isempty(params.err);
     params.err=0;
 end;
 if ~isfield(params,'trialave') || isempty(params.trialave);
     params.trialave=0;
 end;
 
 tapers=params.tapers;
 pad=params.pad;
 Fs=params.Fs;
 fpass=params.fpass;
 err=params.err;
trialave=params.trialave;

[tapers,pad,Fs,fpass,err,trialave,params]=getparams(params);
 if length(params.tapers)==3 & movingwin(1)~=params.tapers(2);
     error('Duration of data in params.tapers is inconsistent with movingwin(1), modify params.tapers(2) to proceed')
 end
 
 if nargout > 3 && err(1)==0; 
 %   Cannot compute error bars with err(1)=0. change params and run again.
     error('When Serr is desired, err(1) has to be non-zero.');
 end;
 data=change_row_to_column(data);
 [N,Ch]=size(data);
 Nwin=round(Fs*movingwin(1)); % number of samples in window
 Nstep=round(movingwin(2)*Fs); % number of samples to step through
 nfft=max(2^(nextpow2(Nwin)+pad),Nwin);
 f=getfgrid(Fs,nfft,fpass); Nf=length(f);
 params.tapers=dpsschk(tapers,Nwin,Fs); % check tapers
 
 winstart=1:Nstep:N-Nwin+1;
 nw=length(winstart); 

 if trialave
     S = zeros(nw,Nf);
     if nargout==4; Serr=zeros(2,nw,Nf); end;
 else
     S = zeros(nw,Nf,Ch);
   if nargout==4; Serr=zeros(2,nw,Nf,Ch); end;
 end
 
 for n=1:nw;
    indx=winstart(n):winstart(n)+Nwin-1;
   datawin=data(indx,:);
   if nargout==4
      [s,f,serr]=mtspectrumc(datawin,params);
      Serr(1,n,:,:)=squeeze(serr(1,:,:));
      Serr(2,n,:,:)=squeeze(serr(2,:,:));
    else
      [s,f]=mtspectrumc(datawin,params);
    end
 S(n,:,:)=s;
 end;
 S=squeeze(S); 
if nargout==4;Serr=squeeze(Serr);end;
 winmid=winstart+round(Nwin/2);
 t=winmid/Fs;