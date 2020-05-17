function m=plotTSP10(Clist,BSF,bsf,p,f)

CityNum=size(Clist,1);

for i=1:CityNum-1
    axis([0,100,0,100]);
    %���Ƶ������ͼ
    plot([Clist(BSF(i),1),Clist(BSF(i+1),1)],[Clist(BSF(i),2),Clist(BSF(i+1),2)],'rs-','LineWidth',2,'MarkerEdgeColor','k','MarkerFaceColor','g');
    hold on;%'rs-','LineWidth',3,'MarkerEdgeColor','','MarkerFaceColor','g'-��ʾ��Ϊ��ɫʵ���߿�Ϊ2����Ϊ�����̵��ԵΪ��ɫ
    
end
axis([0,100,0,100]);
%�������һ�������ʼ�������
plot([Clist(BSF(CityNum),1),Clist(BSF(1),1)],[Clist(BSF(CityNum),2),Clist(BSF(1),2)],'ms-','LineWidth',2,'MarkerEdgeColor','k','MarkerFaceColor','g');
%'ms-','LineWidth',3,'MarkerEdgeColor','','MarkerFaceColor','g'-��ʾ��Ϊ���ɫʵ���߿�Ϊ2����Ϊ�����̵��ԵΪ��ɫ
title([num2str(CityNum),'TSP']);
if f==0
    text(5,5,['�������� ',int2str(p),'  ��̾��� ',num2str(bsf)]);
end
hold off;
pause(0.05); 
