function iterr = iterador10(muestreo, n)
  figure;
  set(gca,'XTick',[]) % Remove the ticks in the x axis!                            
  set(gca,'YTick',[]) % Remove the ticks in the y axis                             
  set(gca,'Position',[0 0 1 1]) % Make the axes occupy the hole figure                            


  % colormap(hot)
  colormap(hsv)
  iterr=zeros(size(muestreo));
      for i = 1:1:n
	for j = 1:1:size(muestreo)(1)
	  for k = 1:1:size(muestreo)(2)
	    iterr(j,k) = (abs(real(iterr(j,k))) + I *abs(imag(iterr(j,k))))^2 +muestreo(j,k)^2;
	  endfor
	endfor
      endfor
      gca= imagesc(angulo(iterr));
      saveas(gcf,sprintf("build/barcoiteracion%d.png",n))
endfunction
