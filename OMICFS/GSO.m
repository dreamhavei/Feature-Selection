function q = GSO(new,old)
%=========================================================================%
%                                  施密特正交化                            %
%=========================================================================%
% Description:
%    Gram-Schmidt orthogonalization施密特正交化，得到的
% 
%-------------------------------------------------------------------------
% 输入： 
%       new      新选入的特征|列向量
%       old      之前施密特正交化的结果|列向量组成 按时间顺序排
%       
% 输出：
% 		q    当前最优子集
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


