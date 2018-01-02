function formula_new=UncertaintyFormula(formula_old)
warning off;
fun_oldstr=strrep(formula_old,'.^','^');
fun_old=sym(fun_oldstr);
fun_new='(';
Temp=findsym(fun_old);
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
for j=1:length(symbol)
    z=(char(symbol{1,j}))';
    sym(z);
    fun_new=[fun_new,'+(',char(diff(fun_old,z)),')^2*(u_',z,')^2'];    
end
fun_new=[fun_new,')^0.5'];
formula_new=strrep(fun_new,'^','.^');
formula_new=strrep(formula_new,'(+','(');
