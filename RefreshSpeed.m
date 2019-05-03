% Update kecepatan mobil
function out = RefreshSpeed(SpeedVec, Distances, Vmax, poss)

for i = 1 : length(SpeedVec) 

    if SpeedVec(i) + 1 < Distances(i) %kecepatan + 1 < jarak
        SpeedVec(i) = SpeedVec(i) + 1;
        if SpeedVec(i) > Vmax
            SpeedVec(i) = Vmax;
        end
    elseif SpeedVec(i) >= Distances(i) && i < length(SpeedVec) %mengurangi kecepatan
        SpeedVec(i) = Distances(i) - 1;
    end
    
    if rand < poss %Randomization
        SpeedVec(i) = SpeedVec(i) - 1;
        if SpeedVec(i) < 0
            SpeedVec(i) = 0;
        end
    end 
end
out = SpeedVec;
end