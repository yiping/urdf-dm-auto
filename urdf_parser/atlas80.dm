# DynaMechs V 4.0 ascii

Articulation {
    Name	"Articulation"
    Graphics_Model		""
    Position			0	0	0
    Orientation_Quat	0	0	0	1
    
    MobileBaseLink {
        Name    "pelvis"
        Graphics_Model    "meshes/pelvis.xan"
        Mass     9.687
        Inertia       0.074506   0.000433  -0.003293 
                      0.000433   0.060206  -0.000271 
                     -0.003293  -0.000271   0.064414
        Center_of_Gravity      0.011100   0.000000   0.027100
        Number_of_Contact_Points	0
        Position	2.080000	2.000000	0.90000	
        Orientation_Quat	0.000000	0.000000	0	1
        Velocity 0 0 0 0 0 0
    }
    Branch {
        
        RevoluteLink {
            Name    "ltorso"
            Graphics_Model    "meshes/ltorso.xan"
            Mass     1.305
            Inertia      0.009397  -0.000000   0.000916 
                        -0.000000   0.009297   0.000001 
                         0.000916   0.000001   0.001112
            Center_of_Gravity     -0.011298  -0.000003   0.074683
            Number_of_Contact_Points	0
            MDH_Parameters	 -0.0125     0.00000000    0.0000     0.00000000
            Initial_Joint_Velocity	0
            Joint_Limits	0	0
            Joint_Limit_Spring_Constant	0
            Joint_Limit_Damper_Constant	0
            Actuator_Type	0
            Joint_Friction	0
        }
        
        
        ZScrewTxLink {
            Name	"ZS_mtorso"
            ZScrew_Parameters      0.161970   0.00000000	
        }
        
        
        RevoluteLink {
            Name    "mtorso"
            Graphics_Model    "meshes/mtorso.xan"
            Mass     0.374
            Inertia      0.000660  -0.000115  -0.000073 
                        -0.000115   0.000330  -0.000179 
                        -0.000073  -0.000179   0.000637
            Center_of_Gravity     -0.008163  -0.030597  -0.013125
            Number_of_Contact_Points	0
            MDH_Parameters	 0.0000    -1.57079633    0.0000     0.3
            Initial_Joint_Velocity	0
            Joint_Limits	0	0
            Joint_Limit_Spring_Constant	0
            Joint_Limit_Damper_Constant	0
            Actuator_Type	0
            Joint_Friction	0
        }
        
        
        ZScrewTxLink {
            Name	"ZS_utorso"
            ZScrew_Parameters      0.000000  -1.57079633	
        }
        
        
        RevoluteLink {
            Name    "utorso"
            Graphics_Model    "meshes/utorso.xan"
            Mass    28.174
            Inertia      0.944277  -0.000542   0.962160 
                        -0.000542   3.593700  -0.001961 
                         0.962160  -0.001961   3.329841
            Center_of_Gravity      0.300000   0.000000  -0.092300
            Number_of_Contact_Points	0
            MDH_Parameters	 0.0500    -1.57079633    0.0000     0.00000000
            Initial_Joint_Velocity	0
            Joint_Limits	0	0
            Joint_Limit_Spring_Constant	0
            Joint_Limit_Damper_Constant	0
            Actuator_Type	0
            Joint_Friction	0
        }
        
        Branch {
            
            ZScrewTxLink {
                Name	"ZS_l_clav"
                ZScrew_Parameters      0.064410  -2.09439530	
            }
            
            
            RevoluteLink {
                Name    "l_clav"
                Graphics_Model    "meshes/l_clav.xan"
                Mass     1.869
                Inertia      0.023568   0.000000   0.000167 
                             0.000000   0.023453   0.000000 
                             0.000167   0.000000   0.000968
                Center_of_Gravity     -0.000431   0.000000   0.096746
                Number_of_Contact_Points	0
                MDH_Parameters	 0.0665    -1.57079633    0.1622     0.100000
                Initial_Joint_Velocity	0
                Joint_Limits	0	0
                Joint_Limit_Spring_Constant	0
                Joint_Limit_Damper_Constant	0
                Actuator_Type	0
                Joint_Friction	0
            }
            
            
            ZScrewTxLink {
                Name	"ZS_l_scap"
                ZScrew_Parameters      0.239994   0.00000000	
            }
            
            
            RevoluteLink {
                Name    "l_scap"
                Graphics_Model    "meshes/l_scap.xan"
                Mass     1.632
                Inertia      0.003158   0.000000   0.000000 
                             0.000000   0.003158   0.000000 
                             0.000000   0.000000   0.001728
                Center_of_Gravity      0.000000   0.000000   0.000000
                Number_of_Contact_Points	0
                MDH_Parameters	 0.0235     1.57079633    0.0000     -0.8236
                Initial_Joint_Velocity	0
                Joint_Limits	0	0
                Joint_Limit_Spring_Constant	0
                Joint_Limit_Damper_Constant	0
                Actuator_Type	0
                Joint_Friction	0
            }
            
            
            ZScrewTxLink {
                Name	"ZS_l_uarm"
                ZScrew_Parameters      0.000000   1.57079633	
            }
            
            
            RevoluteLink {
                Name    "l_uarm"
                Graphics_Model    "meshes/l_uarm.xan"
                Mass     1.835
                Inertia      0.011308   0.000000   0.000000 
                             0.000000   0.011308   0.000000 
                             0.000000   0.000000   0.001939
                Center_of_Gravity      0.000000   0.000000  -0.065000
                Number_of_Contact_Points	0
                MDH_Parameters	 0.0160     1.57079633    0.1870     1.57079633
                Initial_Joint_Velocity	0
                Joint_Limits	0	0
                Joint_Limit_Spring_Constant	0
                Joint_Limit_Damper_Constant	0
                Actuator_Type	0
                Joint_Friction	0
            }
            
            
            ZScrewTxLink {
                Name	"ZS_l_larm"
                ZScrew_Parameters      0.119000   0.00000000	
            }
            
            
            RevoluteLink {
                Name    "l_larm"
                Graphics_Model    "meshes/l_larm.xan"
                Mass     1.359
                Inertia      0.002416  -0.000000   0.000000 
                            -0.000000   0.002416   0.000000 
                             0.000000   0.000000   0.001436
                Center_of_Gravity      0.000000   0.000000   0.000000
                Number_of_Contact_Points	0
                MDH_Parameters	 0.0092    -1.57079633    0.0000     1.5236
                Initial_Joint_Velocity	0
                Joint_Limits	0	0
                Joint_Limit_Spring_Constant	0
                Joint_Limit_Damper_Constant	0
                Actuator_Type	0
                Joint_Friction	0
            }
            
            
            RevoluteLink {
                Name    "l_farm"
                Graphics_Model    "meshes/l_farm.xan"
                Mass     1.835
                Inertia      0.011308   0.000000   0.000000 
                             0.000000   0.011308   0.000000 
                             0.000000   0.000000   0.001939
                Center_of_Gravity      0.000000   0.000000  -0.065000
                Number_of_Contact_Points	0
                MDH_Parameters	 -0.0092     1.57079633    0.1870     0.00000000
                Initial_Joint_Velocity	0
                Joint_Limits	0	0
                Joint_Limit_Spring_Constant	0
                Joint_Limit_Damper_Constant	0
                Actuator_Type	0
                Joint_Friction	0
            }
            
            
            ZScrewTxLink {
                Name	"ZS_l_hand"
                ZScrew_Parameters      0.119000   0.00000000	
            }
            
            
            RevoluteLink {
                Name    "l_hand"
                Graphics_Model    "meshes/l_hand.xan"
                Mass     1.359
                Inertia      0.002416  -0.000000   0.000000 
                            -0.000000   0.002416   0.000000 
                             0.000000   0.000000   0.001436
                Center_of_Gravity      0.000000   0.000000   0.000000
                Number_of_Contact_Points	0
                MDH_Parameters	 0.0092    -1.57079633    0.0000     0.00000000
                Initial_Joint_Velocity	0
                Joint_Limits	0	0
                Joint_Limit_Spring_Constant	0
                Joint_Limit_Damper_Constant	0
                Actuator_Type	0
                Joint_Friction	0
            }
            
        }
        
        Branch {
            
            ZScrewTxLink {
                Name	"ZS_head"
                ZScrew_Parameters      0.216720   0.00000000	
            }
            
            
            RevoluteLink {
                Name    "head"
                Graphics_Model    "meshes/head.xan"
                Mass     0.769
                Inertia      0.006293   0.001127  -0.000001 
                             0.001127   0.002742   0.000001 
                            -0.000001   0.000001   0.007206
                Center_of_Gravity      0.027740  -0.075493   0.000033
                Number_of_Contact_Points	0
                MDH_Parameters	 0.5380     1.57079633    0.0000     0.00000000
                Initial_Joint_Velocity	0
                Joint_Limits	0	0
                Joint_Limit_Spring_Constant	0
                Joint_Limit_Damper_Constant	0
                Actuator_Type	0
                Joint_Friction	0
            }
            
        }
        
        Branch {
            
            ZScrewTxLink {
                Name	"ZS_r_clav"
                ZScrew_Parameters      0.064410  -1.04719735	
            }
            
            
            RevoluteLink {
                Name    "r_clav"
                Graphics_Model    "meshes/r_clav.xan"
                Mass     1.869
                Inertia      0.023568   0.000000  -0.000167 
                             0.000000   0.023453   0.000000 
                            -0.000167   0.000000   0.000968
                Center_of_Gravity      0.000431   0.000000   0.096746
                Number_of_Contact_Points	0
                MDH_Parameters	 -0.0665    -1.57079633    0.1622     -0.10000000
                Initial_Joint_Velocity	0
                Joint_Limits	0	0
                Joint_Limit_Spring_Constant	0
                Joint_Limit_Damper_Constant	0
                Actuator_Type	0
                Joint_Friction	0
            }
            
            
            ZScrewTxLink {
                Name	"ZS_r_scap"
                ZScrew_Parameters      0.239994   0.00000000	
            }
            
            
            RevoluteLink {
                Name    "r_scap"
                Graphics_Model    "meshes/r_scap.xan"
                Mass     1.632
                Inertia      0.003158  -0.000000   0.000000 
                            -0.000000   0.003158   0.000000 
                             0.000000   0.000000   0.001728
                Center_of_Gravity      0.000000   0.000000   0.000000
                Number_of_Contact_Points	0
                MDH_Parameters	 -0.0235     1.57079633    0.0000     0.8236
                Initial_Joint_Velocity	0
                Joint_Limits	0	0
                Joint_Limit_Spring_Constant	0
                Joint_Limit_Damper_Constant	0
                Actuator_Type	0
                Joint_Friction	0
            }
            
            
            ZScrewTxLink {
                Name	"ZS_r_uarm"
                ZScrew_Parameters      0.000000   1.57079633	
            }
            
            
            RevoluteLink {
                Name    "r_uarm"
                Graphics_Model    "meshes/r_uarm.xan"
                Mass     1.835
                Inertia      0.011308   0.000000  -0.000000 
                             0.000000   0.011308   0.000000 
                            -0.000000   0.000000   0.001939
                Center_of_Gravity      0.000000   0.000000   0.065000
                Number_of_Contact_Points	0
                MDH_Parameters	 0.0160     1.57079633    -0.1870     -1.57079633
                Initial_Joint_Velocity	0
                Joint_Limits	0	0
                Joint_Limit_Spring_Constant	0
                Joint_Limit_Damper_Constant	0
                Actuator_Type	0
                Joint_Friction	0
            }
            
            
            ZScrewTxLink {
                Name	"ZS_r_larm"
                ZScrew_Parameters     -0.119000   0.00000000	
            }
            
            
            RevoluteLink {
                Name    "r_larm"
                Graphics_Model    "meshes/r_larm.xan"
                Mass     1.359
                Inertia      0.002416   0.000000   0.000000 
                             0.000000   0.002416   0.000000 
                             0.000000   0.000000   0.001436
                Center_of_Gravity      0.000000   0.000000   0.000000
                Number_of_Contact_Points	0
                MDH_Parameters	 0.0092    -1.57079633    0.0000     1.5236
                Initial_Joint_Velocity	0
                Joint_Limits	0	0
                Joint_Limit_Spring_Constant	0
                Joint_Limit_Damper_Constant	0
                Actuator_Type	0
                Joint_Friction	0
            }
            
            
            RevoluteLink {
                Name    "r_farm"
                Graphics_Model    "meshes/r_farm.xan"
                Mass     1.835
                Inertia      0.011308   0.000000  -0.000000 
                             0.000000   0.011308   0.000000 
                            -0.000000   0.000000   0.001939
                Center_of_Gravity      0.000000   0.000000   0.065000
                Number_of_Contact_Points	0
                MDH_Parameters	 -0.0092     1.57079633    -0.1870     0.00000000
                Initial_Joint_Velocity	0
                Joint_Limits	0	0
                Joint_Limit_Spring_Constant	0
                Joint_Limit_Damper_Constant	0
                Actuator_Type	0
                Joint_Friction	0
            }
            
            
            ZScrewTxLink {
                Name	"ZS_r_hand"
                ZScrew_Parameters     -0.119000   0.00000000	
            }
            
            
            RevoluteLink {
                Name    "r_hand"
                Graphics_Model    "meshes/r_hand.xan"
                Mass     1.359
                Inertia      0.002416   0.000000   0.000000 
                             0.000000   0.002416   0.000000 
                             0.000000   0.000000   0.001436
                Center_of_Gravity      0.000000   0.000000   0.000000
                Number_of_Contact_Points	0
                MDH_Parameters	 0.0092    -1.57079633    0.0000     0.00000000
                Initial_Joint_Velocity	0
                Joint_Limits	0	0
                Joint_Limit_Spring_Constant	0
                Joint_Limit_Damper_Constant	0
                Actuator_Type	0
                Joint_Friction	0
            }
            
        }
        
    }
    
    Branch {
        
        ZScrewTxLink {
            Name	"ZS_l_uglut"
            ZScrew_Parameters      0.000000   1.57079633	
        }
        
        
        RevoluteLink {
            Name    "l_uglut"
            Graphics_Model    "meshes/l_uglut.xan"
            Mass     0.351
            Inertia      0.000386  -0.000006   0.000004 
                        -0.000006   0.000410   0.000021 
                         0.000004   0.000021   0.000237
            Center_of_Gravity     -0.003447  -0.005293   0.003130
            Number_of_Contact_Points	0
            MDH_Parameters	 0.0890     0.00000000    0.0000     0.00000000
            Initial_Joint_Velocity	0
            Joint_Limits	0	0
            Joint_Limit_Spring_Constant	0
            Joint_Limit_Damper_Constant	0
            Actuator_Type	0
            Joint_Friction	0
        }
        
        
        RevoluteLink {
            Name    "l_lglut"
            Graphics_Model    "meshes/l_lglut.xan"
            Mass     0.469
            Inertia      0.001227   0.000324  -0.000119 
                         0.000324   0.000797   0.000197 
                        -0.000119   0.000197   0.000968
            Center_of_Gravity      0.017048  -0.031205   0.013334
            Number_of_Contact_Points	0
            MDH_Parameters	 0.0000     1.57079633    0.0000     0.00000000
            Initial_Joint_Velocity	0
            Joint_Limits	0	0
            Joint_Limit_Spring_Constant	0
            Joint_Limit_Damper_Constant	0
            Actuator_Type	0
            Joint_Friction	0
        }
        
        
        ZScrewTxLink {
            Name	"ZS_l_uleg"
            ZScrew_Parameters      0.050000  -1.57079633	
        }
        
        
        RevoluteLink {
            Name    "l_uleg"
            Graphics_Model    "meshes/l_uleg.xan"
            Mass     4.989
            Inertia      0.010835   0.000000   0.000000 
                         0.000000   0.268764   0.000000 
                         0.000000   0.000000   0.268764
            Center_of_Gravity      0.210000   0.000000   0.000000
            Number_of_Contact_Points	0
            MDH_Parameters	 0.0500    -1.57079633    0.0000     -0.5
            Initial_Joint_Velocity	0
            Joint_Limits	0	0
            Joint_Limit_Spring_Constant	0
            Joint_Limit_Damper_Constant	0
            Actuator_Type	0
            Joint_Friction	0
        }
        
        
        ZScrewTxLink {
            Name	"ZS_l_lleg"
            ZScrew_Parameters      0.000000   0.13290179	
        }
        
        
        RevoluteLink {
            Name    "l_lleg"
            Graphics_Model    "meshes/l_lleg.xan"
            Mass     2.968
            Inertia      0.005420  -0.001070   0.000000 
                        -0.001070   0.145507   0.000000 
                         0.000000   0.000000   0.144968
            Center_of_Gravity      0.187000  -0.001000   0.000000
            Number_of_Contact_Points	0
            MDH_Parameters	 0.3773     0.00000000    0.0000    0.9  #-0.13290179
            Initial_Joint_Velocity	0
            Joint_Limits	0	0
            Joint_Limit_Spring_Constant	0
            Joint_Limit_Damper_Constant	0
            Actuator_Type	0
            Joint_Friction	0
        }
        
        
        RevoluteLink {
            Name    "l_talus"
            Graphics_Model    "meshes/l_talus.xan"
            Mass     0.068
            Inertia      0.000007  -0.000000   0.000000 
                        -0.000000   0.000006   0.000000 
                         0.000000   0.000000   0.000005
            Center_of_Gravity      0.000000   0.000000   0.000000
            Number_of_Contact_Points	0
            MDH_Parameters	 0.4220     0.00000000    0.0000     -0.5
            Initial_Joint_Velocity	0
            Joint_Limits	0	0
            Joint_Limit_Spring_Constant	0
            Joint_Limit_Damper_Constant	0
            Actuator_Type	0
            Joint_Friction	0
        }
        
        
        RevoluteLink {
            Name    "l_foot"
            Graphics_Model    "meshes/l_foot.xan"
            Mass     1.111
            Inertia      0.005143   0.000000  -0.002009 
                         0.000000   0.009587   0.000000 
                        -0.002009   0.000000   0.006069
            Center_of_Gravity      0.067000   0.000000   0.027000
            Number_of_Contact_Points	4
            Contact_Locations          0.080970   0.064725   0.179399
                                       0.080970   0.064725  -0.083928
                                       0.080970  -0.065372  -0.083928
                                       0.080970  -0.065372   0.179399
            MDH_Parameters	 0.0000     1.57079633    0.0000     0.00000000
            Initial_Joint_Velocity	0
            Joint_Limits	0	0
            Joint_Limit_Spring_Constant	0
            Joint_Limit_Damper_Constant	0
            Actuator_Type	0
            Joint_Friction	0
        }
        
    }
    
    Branch {
        
        ZScrewTxLink {
            Name	"ZS_r_uglut"
            ZScrew_Parameters      0.000000   1.57079633	
        }
        
        
        RevoluteLink {
            Name    "r_uglut"
            Graphics_Model    "meshes/r_uglut.xan"
            Mass     0.351
            Inertia      0.000386   0.000006  -0.000004 
                         0.000006   0.000410   0.000021 
                        -0.000004   0.000021   0.000237
            Center_of_Gravity      0.003447  -0.005293   0.003130
            Number_of_Contact_Points	0
            MDH_Parameters	 -0.0890     0.00000000    0.0000     0.00000000
            Initial_Joint_Velocity	0
            Joint_Limits	0	0
            Joint_Limit_Spring_Constant	0
            Joint_Limit_Damper_Constant	0
            Actuator_Type	0
            Joint_Friction	0
        }
        
        
        RevoluteLink {
            Name    "r_lglut"
            Graphics_Model    "meshes/r_lglut.xan"
            Mass     0.469
            Inertia      0.001227  -0.000324   0.000119 
                        -0.000324   0.000797   0.000197 
                         0.000119   0.000197   0.000968
            Center_of_Gravity     -0.017048  -0.031205   0.013334
            Number_of_Contact_Points	0
            MDH_Parameters	 0.0000     1.57079633    0.0000     0.00000000
            Initial_Joint_Velocity	0
            Joint_Limits	0	0
            Joint_Limit_Spring_Constant	0
            Joint_Limit_Damper_Constant	0
            Actuator_Type	0
            Joint_Friction	0
        }
        
        
        ZScrewTxLink {
            Name	"ZS_r_uleg"
            ZScrew_Parameters      0.050000  -1.57079633	
        }
        
        
        RevoluteLink {
            Name    "r_uleg"
            Graphics_Model    "meshes/r_uleg.xan"
            Mass     4.989
            Inertia      0.010835   0.000000   0.000000 
                         0.000000   0.268764   0.000000 
                         0.000000   0.000000   0.268764
            Center_of_Gravity      0.210000   0.000000   0.000000
            Number_of_Contact_Points	0
            MDH_Parameters	 0.0500    -1.57079633    0.0000     -0.5
            Initial_Joint_Velocity	0
            Joint_Limits	0	0
            Joint_Limit_Spring_Constant	0
            Joint_Limit_Damper_Constant	0
            Actuator_Type	0
            Joint_Friction	0
        }
        
        
        ZScrewTxLink {
            Name	"ZS_r_lleg"
            ZScrew_Parameters      0.000000   0.13290179	
        }
        
        
        RevoluteLink {
            Name    "r_lleg"
            Graphics_Model    "meshes/r_lleg.xan"
            Mass     2.968
            Inertia      0.005420  -0.001070   0.000000 
                        -0.001070   0.145507   0.000000 
                         0.000000   0.000000   0.144968
            Center_of_Gravity      0.187000  -0.001000   0.000000
            Number_of_Contact_Points	0
            MDH_Parameters	 0.3773     0.00000000    0.0000    0.9  #-0.13290179
            Initial_Joint_Velocity	0
            Joint_Limits	0	0
            Joint_Limit_Spring_Constant	0
            Joint_Limit_Damper_Constant	0
            Actuator_Type	0
            Joint_Friction	0
        }
        
        
        RevoluteLink {
            Name    "r_talus"
            Graphics_Model    "meshes/r_talus.xan"
            Mass     0.068
            Inertia      0.000007  -0.000000   0.000000 
                        -0.000000   0.000006   0.000000 
                         0.000000   0.000000   0.000005
            Center_of_Gravity      0.000000   0.000000   0.000000
            Number_of_Contact_Points	0
            MDH_Parameters	 0.4220     0.00000000    0.0000     -0.5
            Initial_Joint_Velocity	0
            Joint_Limits	0	0
            Joint_Limit_Spring_Constant	0
            Joint_Limit_Damper_Constant	0
            Actuator_Type	0
            Joint_Friction	0
        }
        
        
        RevoluteLink {
            Name    "r_foot"
            Graphics_Model    "meshes/r_foot.xan"
            Mass     1.111
            Inertia      0.005143   0.000000  -0.002009 
                         0.000000   0.009587   0.000000 
                        -0.002009   0.000000   0.006069
            Center_of_Gravity      0.067000   0.000000   0.027000
            Number_of_Contact_Points	4
            Contact_Locations          0.081351   0.066170   0.180124
                                       0.081351   0.066170  -0.083203
                                       0.081351  -0.063927  -0.083203
                                       0.081351  -0.063927   0.180124
            MDH_Parameters	 0.0000     1.57079633    0.0000     0.00000000
            Initial_Joint_Velocity	0
            Joint_Limits	0	0
            Joint_Limit_Spring_Constant	0
            Joint_Limit_Damper_Constant	0
            Actuator_Type	0
            Joint_Friction	0
        }
        
    }
    
}
