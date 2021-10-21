%for this experiment, [0.25, 0.34375) is neglected because of the 7MSB
%1. fit gm1(m2) in [0.34375, 0.375), [0.375, 0.53125), [0.53125, 0.5625)
%2. find method to mapping fm1(m1) to gm2(m2)
%3. calculate the error

Gr = [
    2^0+2^-2, 2^0+2^-2, 2^0+2^-2, 2^0+2^-2, 2^0+2^-2; 
    2^0, 2^0, 2^0, 2^0, 2^0; 
    2^0-2^-3, 2^0-2^-3, 2^0-2^-3, 2^0-2^-3, 2^0-2^-3; 
    2^0-2^-2, 2^0-2^-2, 2^0-2^-2, 2^0-2^-2, 2^0-2^-2; 
    ]; %1.25, 1, 0.875, 0.75

m2 = [
	0.25, 0.34375, 0.375, 0.53125, 0.5625; 
    0.25, 0.25, 0.34375, 0.375, 0.5; 
	0.3125, 0.3125, 0.34375, 0.375, 0.53125; 
    0.3125, 0.3125, 0.34375, 0.375, 0.5; %forcibly included m1 = 1 into the orginal algo
	]; 

	m1 = (m2+1)./Gr-1; 
    for N1 = (1 : 1 : 4) 
        for M1 = (1 : 1 : 5) 
            gm1(N1,M1) = castrARM4(m1(N1,M1));  %#ok<SAGROW>
        end
    end
    %file = 'experiment.txt'; 
    %delete(file); 
    for N2 = (1 : 1 : 1) %only seg 1 for now
        for M2 = (3 : 1 : 5) %neglect f1 part 
            xi = m2(N2, M2-1) : 0.00001 : m2(N2, M2); 
            m2i = [m2(N2, M2-1); m2(N2, M2)]; 
            gm1i = [gm1(N2, M2-1); gm1(N2, M2)]; 
            pi = polyfit(m2i, gm1i, 1); 
            disp(pi); 
            yi = polyval(pi, xi); 
            plot(xi, yi); 
            hold on; 
        end 
    end 
    x = 0 : 0.001 : 1; 
    y = log2(x+1); 
    plot(x, y); 
%    for I = (1 : 1 : 1) 
%        disp(I); 
%        disp(['m1: ', num2str(m1(I,:))]); 
%        disp(['m2: ', num2str(m2(I,:))]); 
%        disp(['gm1: ', num2str(gm1(I,:))]); 
%        %fclose('all'); 
%    end 