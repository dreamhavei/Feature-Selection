function Fopt = MIMIC_FS(CFmic,FFmic,varargin)
%=========================================================================%
%                    ѡ��ǰ�Ӽ�����Ҫ����(predominant feature)           %
%=========================================================================%
% Description:
%    �ӵ�ǰ�����Ӽ���ѡ��ǰ�Ӽ�����Ҫ����
% 
%-------------------------------------------------------------------------
% ���룺 
%       CFmic    ��������֮���MIC
%       FFmic    ����������֮���MIC 
%       index    i
%       Fopt     ��ǰ�����Ӽ�
% �����
% 		Fopt 
%--------------------------------------------------------------------------
% Reference:
%   2018-Feature selection for IoT based on maximal information coefficient

thet = [];
if length(varargin) >=1
    thet      = varargin{1};
end      
if isempty(thet)
    thet           = 0.5;
end

[~,Forder]          = sort(CFmic,'descend'); % ǰvalue ��index
% ѡ��ǰ�Ӽ�����Ҫ����(predominant feature)   FFmic
PredFeature          = Forder(1);
Forder(1)            = [];
Fopt                 = PredFeature;
while ~isempty(Forder)
    PredFeature      = Forder(1);   % i    i��Fopt  getMainElement
%         disp([num2str(k),' Fopt=',num2str(Fopt),' PredFeature =',num2str(PredFeature)]);
    if (CFmic(PredFeature) - sum(FFmic([PredFeature,Fopt],[PredFeature,Fopt]))./length(Fopt)) < thet
        Forder(Forder==PredFeature) = []; 
    else
        Forder(Forder==PredFeature) = [];  
        Fopt                        = [Fopt,PredFeature];
    end
    MBfeature                       = findMBElement(PredFeature,Forder,CFmic,FFmic);  % 
    if ~isempty(MBfeature)
        if (sum(CFmic(MBfeature)) - sum(FFmic([MBfeature,Fopt],[MBfeature,Fopt]))./length(Fopt)) < thet
            Forder(Forder == MBfeature) = [];
        end
    end
end