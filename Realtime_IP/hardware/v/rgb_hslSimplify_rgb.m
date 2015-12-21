% make an rgb look-up table that maps a simplified hsl space
% list rgb inputs at some precision, map each to hsl, simplify that hsl, map to rgb output, so there will be duplicates in the output list

bits = 3;
n = 2^bits;

% input list
rgbIN = zeros(n^3,3);
for r=0:n-1
    for g=0:n-1
        for b = 0:n-1
            rgbIN(r*n^2 + g*n + b + 1,:) = [r,g,b];
        end 
    end
end
rgbIN = rgbIN ./ n;


hsl = rgb2hsl(rgbIN);


% simplify in hsl space
hsl(:,1) = round(hsl(:,1) .* 32) ./ 32 ;
hsl(:,2) = round(hsl(:,2) .* 4) ./ 4   ;
hsl(:,3) = floor(hsl(:,3) .* 3) ./ 3 + 0.3 ;

rgbOUT = hsl2rgb(hsl);


%convert to bit representation
rgbIN = uint8(floor(rgbIN .* n ));
rgbOUT = uint8(floor(rgbOUT .* n -0.01));


for i=1:size(rgbIN,1)
     line = strcat('9"b',dec2bin(rgbIN(i,1),bits),...
         dec2bin(rgbIN(i,2),bits),dec2bin(rgbIN(i,3),bits),...
         ': tableResult <= {9"b',dec2bin(rgbOUT(i,1),bits),...
         dec2bin(rgbOUT(i,2),bits),dec2bin(rgbOUT(i,3),bits),'};');
         
     
     disp(line);
end


