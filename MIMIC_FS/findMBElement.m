function MB = findMBElement(index,Fopt,CFmic,FFmic)
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
% 		MB: MB(i) i�ıƽ�����Ʒ�̺
%--------------------------------------------------------------------------
% Reference:
%   2018-Feature selection for IoT based on maximal information coefficient

MB = Fopt(and(bsxfun(@gt,CFmic(Fopt),CFmic(index)),bsxfun(@lt,CFmic(index),[(FFmic(Fopt(Fopt<index),index))',FFmic(index,Fopt(Fopt>=index))])));





