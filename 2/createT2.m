function T = createT2()
    T = zeros(49,784);
    for x = 1:49
        
            i = mod((x-1),7)+1;
            j = fix((x-1)/7)+1;
            for selection = 1:784
                iold = mod((selection-1),28)+1;
                jold = fix((selection-1)/28)+1;
                
               if i == fix((iold-1)/4)+1 && j ==...
                       fix((jold-1)/4)+1
                   T(x,selection) = 1/16;
               end
            end
     end
        
end

    