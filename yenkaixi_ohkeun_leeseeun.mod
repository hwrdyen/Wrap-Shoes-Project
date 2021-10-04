set Shoes;
set Machines;
set Materials;
set Stores;
set Years;

param price{i in Shoes} >= 0;
param averageDemand{i in Shoes} >= 0;
param machineTime{i in Shoes, j in Machines};
param operatingCost{j in Machines};
param material{i in Shoes, k in Materials};
param materialCapacity{k in Materials};
param materialCost{k in Materials};
param warehouseCapacity;
param totalMachineTime;
param budget;
param demand{i in Shoes, y in Years, s in Stores};

# Decision variable
var x{i in Shoes} integer >= 0, <= 2*averageDemand[i];

# Objective Function
maximize revenue: sum{i in Shoes} (price[i]*x[i] - sum{k in Materials} materialCost[k]*material[i,k]*x[i] -
		10*(2*averageDemand[i] - x[i]) - sum{j in Machines} (machineTime[i,j]/60)*(operatingCost[j]+(5/12)));

# Constraints
subject to wareCapacity: sum{i in Shoes} x[i] <= warehouseCapacity;
subject to timeCapacity: sum{i in Shoes, j in Machines} (machineTime[i,j]/60)*x[i] <= totalMachineTime;
subject to budegtCapacity: sum{i in Shoes, k in Materials} materialCost[k]*material[i,k]*x[i] <= budget;
subject to matCapacity{k in Materials}: sum{i in Shoes} material[i,k] <= materialCapacity[k];




