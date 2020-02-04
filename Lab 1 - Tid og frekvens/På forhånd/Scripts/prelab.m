n = 100% FYLL INN SELV
a = 3;
b = 2;
x = a+b*randn(1,n);
xmid = 10% FYLL INN SELV
s = 1% FYLL INN SELV
sm =5% FYLL INN SELV

figure(1),clf
plot(x,'k.'), xlabel('Måling-nummer'),ylabel('x')

hold on

line([0 n],[xmid xmid],'Color','k','LineStyle','-')
line([0 n],[xmid-s xmid-s],'Color','k','LineStyle','--')
line([0 n],[xmid+s xmid+s],'Color','k','LineStyle','--')
line([0 n],[xmid-sm xmid-sm],'Color','k','LineStyle',':')
line([0 n],[xmid+sm xmid+sm],'Color','k','LineStyle',':')
title(['Syntetisk datasett med ',num2str(n),' målinger'])
text(10,xmid-s-.5,'-ett standardavvik')
text(10,xmid+s+.5,'+ett standardavvik')
text(10,xmid+sm+.5,'+ett standardavvik til middelverdien')
text(10,xmid-sm-.5,'-ett standardavvik til middelverdien')
hold off