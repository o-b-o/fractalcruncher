

function samplespace =  sampler (xmin,xmax,ymin,ymax, div)
  samplespace=[];

  [xes,ys] = meshgrid(xmin:div:xmax, ymin:div:ymax);

 
  for i = 1:1:size(xes)(2)
	    for j = 1:1:size(ys)(1)
	      samplespace(j,i)=complex(xes(1,i),ys(j));
	    endfor
  endfor
  
endfunction	      
