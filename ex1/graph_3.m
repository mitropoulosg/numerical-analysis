function graph_3(x,y1,y2)
figure
subplot(2,2,[1 3])
plot(x,y1,'r-',x,y2,'b-*','MarkerSize',2)
xlabel ( 'Axonas x','FontName','Arial','FontSize',10); 
ylabel ( 'Axonas y','FontName','Arial','FontSize',10);
legend('f1','f2');
title( 'Grafiki parastasi f1, f2','FontSize',10 );
grid on;

subplot(2,2,2);
plot(x,y1,'r-') 
xlabel ( 'Axonas x','FontName','Arial','FontSize',10); 
ylabel ( 'Axonas y','FontName','Arial','FontSize',10);
title('f1')
grid on;

subplot(2,2,4);
plot(x,y2,'b-*')
xlabel ( 'Axonas x','FontName','Arial','FontSize',10); 
ylabel ( 'Axonas y','FontName','Arial','FontSize',10);
title('f2')
grid on;
