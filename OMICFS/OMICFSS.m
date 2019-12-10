function [index,q] = OMICFSS(new,old,class)
%=========================================================================%
%                    ѡ��ǰ�Ӽ�����Ҫ����(predominant feature)           %
%=========================================================================%
% Description:
%    OMICFSS
% 
%-------------------------------------------------------------------------
% ���룺 
%       new      �����ѡ����
%       old      �Աȼ�
%       class
% �����
%       index    ����OMICFSSֵ��Ӧ����
% 		q        ����OMICFSSֵ��GSOֵ
%--------------------------------------------------------------------------
% Reference:
%   2017-A filter feature selection method based on the Maximal Information
%  Coefficient and Gram-Schmidt Orthogonalization for biomedical data mining
%
% version 1.0 -- January/2019
% Implemented by: Liyu Yang
% Contact Info  : yangliyuokn@sina.cn


parfor i      = 1:size(new,2)
     Q(:,i)   = GSO(new(:,i),old);  % ����GSO��ý��
     Temp     = mine(Q(:,i)',class');
     Tmic(i)  = Temp.mic;
end
[~,index]     = max(Tmic);
q             = Q(:,index);

