function formula_new=UncertaintyFormula(formula_old)
%   UNCERTAINTYFORMULA Calculate uncertainty formula.
%
%   UncertaintyFormula(formula_old) Give a string output which is the
%   string input formula(formula_old)'s uncertainty formula
%   
%   NOTE:
%       All symbols' uncertainty items are shown as:
%       u_symbolname
%
%   For example
%       UncertaintyFormula('x.^4+(y_1).^5')
%       ans =((4.*x.^3).^2.*(u_x).^2+(5.*y_1.^4).^2.*(u_y_1).^2).^0.5

warning off;%�رվ���
%formula_old������ַ���ʽ
forumla_old=strrep(formula_old,'.^','^');%�滻һЩ�������
forumla_old=strrep(forumla_old,'.*','*');
try
    fun_old=sym(forumla_old);%sym��ʽ����ʽ
catch
    errordlg('Please enter correct expression!')
    return;
end
formula_new='(';
Temp=findsym(fun_old);%Temp����ʽ�ڵı���
symbol{1,1}={};
a=1;
for i=1:length(Temp)
    if Temp(i)~=','
        symbol{1,a}=[symbol{1,a},Temp(i)];
    else
        a=a+1;
        symbol{1,a}={};
    end
end
%symbol��д������ļ���ʽ�ڱ���
for j=1:length(symbol)
    z=(char(symbol{1,j}))';
    sym(z);
    formula_new=[formula_new,'+(',char(diff(fun_old,z)),')^2*(u_',z,')^2'];%���ɱ��ʽ��z��������    
end
formula_new=[formula_new,')^0.5'];
%�滻��һЩ�������
formula_new=strrep(formula_new,'^','.^');
formula_new=strrep(formula_new,'(+','(');
formula_new=strrep(formula_new,'*','.*');

