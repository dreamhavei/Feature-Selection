function q = GSO(new,old)
%=========================================================================%
%                                  ʩ����������                            %
%=========================================================================%
% Description:
%    Gram-Schmidt orthogonalizationʩ�������������õ���
% 
%-------------------------------------------------------------------------
% ���룺 
%       new      ��ѡ�������|������
%       old      ֮ǰʩ�����������Ľ��|��������� ��ʱ��˳����
%       
% �����
% 		q    ��ǰ�����Ӽ�
%--------------------------------------------------------------------------
% Reference:
%   2017-A filter feature selection method based on the Maximal Information
%  Coefficient and Gram-Schmidt Orthogonalization for biomedical data mining
%
% version 1.0 -- January/2019
% Implemented by: Liyu Yang
% Contact Info  : yangliyuokn@sina.cn


%% 
u        = new;
parfor i = 1:size(old,2)
    u    = u -old(:,i)*((new'*old(:,i))./(old(:,i)'*old(:,i)));
end
q        = u./norm(u);


