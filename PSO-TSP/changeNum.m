function C=changeNum(x,y)
CityNum=size(x,2);%���ؾ���x������
C=ones(CityNum-1,2);%��ʼ��һ��������
for i=1:CityNum-1
    pos=find(x==y(i));%�ҵ�x�е�i��Ԫ�غ�y��Ԫ����ͬ��λ���γ�һ��������
    C(i,:)=[i pos];%�����ӵĲ���
    %x=changeFun(x,C(i,:));
end
end
 
