function BasePSOforTSP 
%��ʼ��
w1=0.5; %���徭�鱣������
w2=0.5; %ȫ�־��鱣������ 
M=300; %����������
m=30;  %΢����
CityNum=30;  %����Ĺ�ģ�����и�����
[dislist,Clist]=tsp(CityNum);%����dislist������������м�ľ��룬Clist��ʾ���е��б�
 
NC=1;%����������
R_best=zeros(M,CityNum); %�������·��
L_best=inf.*ones(M,1);%�������·�ߵĳ���
L_ave=zeros(M,1);%����·�ߵ�ƽ������
 
%����΢���ĳ�ʼλ��
for i=1:m
    x(i,:)=randperm(CityNum);%����30��΢��Ҫ�ߵ�30�����е��б�
    L(i)=SumDistance(dislist,x(i,:));%������30��΢�����԰��ϱ�·���ߵ���·��
end
p=x; %pΪ������ý�
pL=L;%�������ʾÿ������Ŀǰ�����·����Ҳ��������Ҳ�ǳ�ʼ�����Ժ��������ҲҪ���ϸ���
[L_best(1,1), n_best]=min(L);%L_best(1,1)��ʾ��ʼ����30�������������ܾ��룬n_best��ʾ�ڼ������������Ž�
R_best(1,:)=x(n_best,:);%R_best(1,:)��ʾ��ǰ����΢�����߳��е�·��
L_ave(1,1)=mean(L);%L_ave(1,1)��30��΢���ߵ���·�̵�ƽ��ֵ
 
%��ʼ������
v=ones(CityNum-1,2,m);
 
figure(1);
while NC<=M %ֹͣ����֮һ���ﵽ����������
    for i=1:m
       xnew(i,:)=changeFun(x(i,:),v(:,:,i));%��ʼ�������󷵻صľ�������
        A=changeNum(x(i,:),p(i,:));%�����������ȽϵĽ�����
        Arand=randFun(A,w1);%�����Ը��徭����б���
        xnew(i,:)=changeFun(xnew(i,:),Arand);%�Ծ����Ѿ������Ľ��и������µ�λ�á�
        B=changeNum(x(i,:),R_best(NC,:));%������ȫ��������ȽϵĽ�����
        Brand=randFun(B,w2);%������ȫ�־�����б���
        xnew(i,:)=changeFun(xnew(i,:),Brand);%�Ծ����Ѿ������Ľ��и������µ�λ��
        v(:,:,i)=changeNum(x(i,:),xnew(i,:));%��¼ʵ�ʽ�����
        L(i)=SumDistance(dislist,xnew(i,:));%������30��΢�����԰��ϱ�·���ߵ���·��
        if L(i)<pL(i)%�˴θ��µ���·�̱���������
            p(i,:)=xnew(i,:);
            pL(i)=L(i);%�����ֲ����Ž�
        end
    end
    [L_bestnew, n_best]=min(L);%L_bestnew������ʾ��ǰ���µ�ȫ�����·�����ȣ�n_best��ʾ�ǵ�n_best���ﵽ����
    R_bestnew=xnew(n_best,:);%R_bestnew�����õ���ǰ����·������·
    L_ave(NC+1,1)=mean(L);%�˴θ���30�����ӵ�����·�̵�ƽ��ֵ
    if L_bestnew<L_best(NC,1)%�Ƚϴ˴θ������·���������ǰ��·������
        L_best(NC+1,1)=L_bestnew;
        R_best(NC+1,:)=R_bestnew;%�ҵ����Ž⣬����ǰ���滻��������������1
    else
        L_best(NC+1,1)=L_best(NC,1);
        R_best(NC+1,:)=R_best(NC,:);%��ʾ�˴θ���û�б���ǰ���ţ�������ǰ�ģ�����������1
    end
    x=xnew;
    plotTSP10(Clist,R_best(NC,:),L_best(NC,1),NC,0);%clist�ǹ��ڳ���λ�õ�һ�����󣬲����ƴ˴�·��ͼ
    %pause;
    NC=NC+1;
end
 
%������
Pos=find(L_best==min(L_best));%�ڵ�����ɺ��ҳ����յ����·��������
Shortest_Route=R_best(Pos(1),:);%�������ҵ����·�����������ߵ�·��
Shortest_Length=L_best(Pos(1));%�������յ����·���ĳ���
figure(2);
plot([L_best L_ave]);%����ÿ�ε��������·����ƽ��·���ı仯��ʹ��Ҹ����׿������㷨��Ч��
text(85,4.5,['���������������̾���Ϊ ',num2str(Shortest_Length)]);
legend('��̾���','ƽ������');%%�����������·����ƽ��·��
end
 
