clc;
clear;


% CONSTANTA
RoadLen = 100; %panjang maximum lintasan
Vmax = 5;      %kecepatan maximum
SimTime = 100; %banyaknya waktu untuk berjalan di dalam looping
GenCarPoss = 1.5;
Randomization = 0.3;
Pausetime = 0.1;


% INISIALISASI
NoMobil = ceil(SimTime * (GenCarPoss + 0.1)); % Penomeran untuk setiap kendaraan
CSpace = zeros(1, RoadLen);
SpeedVec = zeros(1, NoMobil);

CarID = 1;

%
for i = 1 : SimTime
    DrawingCellSpace(CSpace); % menggambarkan alur
    pause(Pausetime);
    
    jarak = GetDistanceBetweenCars(CSpace)%jarak
    if (isempty(jarak))
        [CSpace, CarID] = GenerateNewCar(CSpace, CarID, GenCarPoss);
        continue;
    end;
    ids = GetCarIDs(CSpace);
    kecepatan = SpeedVec(ids) %kecepatan mobil yang ada di dalam lintasan
    vRef = RefreshSpeed(kecepatan, jarak, Vmax, Randomization);
    SpeedVec(ids) = vRef;
    CSpace = UpdatePos(vRef, CSpace);
    
    [CSpace, CarID] = GenerateNewCar(CSpace, CarID, GenCarPoss);
    
end

