function v=randFun(v,w)
randLen=size(v,1);%���ؾ���v������
 
for i=1:randLen
    if rand>w
        v(i,2)=v(i,1);%��������1-w
    end
end    
end

