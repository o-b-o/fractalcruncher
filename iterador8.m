# queremos ahora mostrar al fractal usando el numero de iteraciones 
# n es el numero de iteraciones
# a= [amin, amax] son el rango de exploracion de los parametros en C
# b = [bmin,bmax]
# step = r es el tamanio del paso entre puntos del intervalo
function iterr = iterador8(muestreo, n, a, b, step)
  figure('position', [0,0,100,100]);
  amin=a(1);
  bmin=b(1);
  amax=a(2);
  bmax=b(2);

  set(gca,'XTick',[]) % Remove the ticks in the x axis!                            
  set(gca,'YTick',[])                             
  set(gca,'Position',[0 0 1 1]) % Make the axes occupy the hole figure                            
#  map = colores(pi/3,pi/4,pi/2,40,3);
#  colormap(jet);
#  colormap(viridis);
  colormap(cubehelix);
  limite = 10;
  indxx=0;

  for a = amin:step:amax
    for b = bmin:step:bmax
      indxx=indxx+1;
      escape = zeros(size(muestreo)); % con esto medimos el momento en que el numero 'escapa'
      iterr=muestreo;
      z=complex(a,b);
      for i = 1:1:n
	for j = 1:1:size(muestreo)(1)
	  for k = 1:1:size(muestreo)(2)
	% fractal function
	% julia    
	%    iterr(j,k) = iterr(j,k)*iterr(j,k)+z;
	% cross
%    iterr(j,k) = (abs(real(iterr(j,k))) + I *abs(imag(iterr(j,k))))^z +muestreo(j,k)^z;
	    % hokusai metafractal 
	    iterr(j,k) = transpose(iterr(j,k))^(z+2) + z;
	    if abs(iterr(j,k)) < limite
	      escape(j,k)+=abs(iterr(j,k));
	    endif
	  endfor
	endfor
      endfor
      gca= imagesc(escape);
      % gca = imagesc(angulo(transpose(iterr)));
      %h=text(3,3,sprintf("%d + %d i", a,b));
      %set(h,'Color',[1,1,1]);
      saveas(gcf,sprintf("build/%06d.png",indxx))
    endfor
  endfor
endfunction
