function iterr = iterador9(muestreo, n)
  figure('position',[0,0,500,500]);
  amin=-0.5;
  bmin=-0.5;
  amax=0.5;
  bmax=0.5;
  step=0.1;
  set(gca,'XTick',[]) % Remove the ticks in the x axis!                            
  set(gca,'YTick',[]) % Remove the ticks in the y axis                             
  set(gca,'Position',[0 0 1 1]) % Make the axes occupy the hole figure                            
#  map = colores(pi/3,pi/4,pi/2,40)
#  colormap(jet)
  colormap(hsv)
  for a = amin:step:amax
    for b = bmin:step:bmax
      iterr=muestreo;
      z=complex(a,b);
      for i = 1:1:n
	for j = 1:1:size(muestreo)(1)
	  for k = 1:1:size(muestreo)(2)
	    
	    iterr(j,k) = (iterr(j,k))^2 +z;
	  endfor
	endfor
      endfor
      gca= imagesc(angulo(iterr));
      h=text(3,3,sprintf("%d +  %d i", a,b));
      set(h,'Color',[1,1,1]);
      saveas(gcf,sprintf("build/%06dmasi %d.png",a-amin,b-bmin))
    endfor
  endfor
endfunction
