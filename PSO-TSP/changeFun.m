function xnew=changeFun(x,C)
changeLen=size(C,1);%���ؾ���c������
xnew=x;
for i=1:changeLen
    a=xnew(C(i,1));
    xnew(C(i,1))=xnew(C(i,2));%ͨ��c���������Ե�ǰ���ӽ��и���
    xnew(C(i,2))=a;%�������λ��
end
end
