String e = "einstein";
String b= "broshim";

List<String> e_building = ["A","B","C","D","E","F","G","H"];
List<String> b_building = ["A","B","C","D","E","F","G","H","I","J","K"];
Map meonot_all = {"einstein":e_building, "broshim":b_building };
// einstein floors
List<String> e_a_floor = ["1","2","3","4"];
List<String> e_b_floor = ["-1", "0","1","2","3","4"];
List<String> e_c_floor = ["0","1","2","3","4"];
List<String> e_d_floor = ["-1", "0","1","2","3","4"];
List<String> e_e_floor = ["0","1","2","3","4"];
List<String> e_f_floor = ["0","1","2","3","4","5"];
List<String> e_g_floor = ["0","1","2","3","4"];
List<String> e_h_floor = [];
Map e_floors = {"a":e_a_floor,"b":e_b_floor, "c": e_c_floor, "d":e_d_floor, "e":e_e_floor, "f":e_f_floor,"g":e_g_floor,"h":e_h_floor};

// broshim floors
List<String> b_a_floor = ["0","1","2","3","4","5","6","7","8","9","ROOF","G"];
List<String> b_b_floor = ["0","1","2","3","4","5","6","7","8","9","ROOF","G"];
List<String> b_c_floor = ["0","1","2","3","4","5","6","7","ROOF","G"];
List<String> b_d_floor = ["0","1","2","3","4","5","6","7","ROOF","G"];
List<String> b_e_floor = ["0","1","2","3","4","5","6","7","ROOF","G"];
List<String> b_f_floor = ["-1","0","1","2","3","4","5","6","7","8","9","10","11", "12","ROOF"];
List<String> b_g_floor = ["0","1","2","3","4","5","6","7","8","9","10","11", "12","13","14","15","G"];
List<String> b_h_floor = ["0","1","2","3","4","5","6","7","8","9","10","11", "12","13","14","15","G"];
List<String> b_i_floor = ["0","1","2","3","4","5","6","7","8"];
List<String> b_j_floor = ["0","1","2","3","4","5","6","7","8"];
List<String> b_k_floor = ["0","1","2","3","4","5","6","7","8"];
Map b_floors = {"a":b_a_floor,"b":b_b_floor, "c": b_c_floor, "d":b_d_floor, "e":b_e_floor, "f":b_f_floor,"g":b_g_floor,"h":b_h_floor, "i":b_i_floor, "j": b_j_floor, "k": b_k_floor};

// map of all the floors map
Map floors_all = {"einstein": e_floors, "broshim": b_floors};