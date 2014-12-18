# DynaMechs V 4.0 ascii

Articulation {
    Name	"Articulation"
    Graphics_Model		""
    Position			0	0	0
    Orientation_Quat	0	0	0	1
    
    MobileBaseLink {
        Name    "pelvis"
        Graphics_Model    "meshes/pelvis.xan"
        Mass    17.882
        Inertia       0.137533   0.000800  -0.006079 
                      0.000800   0.111136  -0.000500 
                     -0.006079  -0.000500   0.118903
        Center_of_Gravity      0.011100   0.000000   0.027100
        Number_of_Contact_Points	0
        Position	2.000000	2.000000	0.980000	
        Orientation_Quat	0.000000	0.000000	0	1
        Velocity 0 0 0 0 0 0
    }
    Branch {
        
        RevoluteLink {
            Name    "ltorso"
            Graphics_Model    "meshes/ltorso.xan"
            Mass     2.409
            Inertia      0.017346  -0.000000   0.001691 
                        -0.000000   0.017161   0.000001 
                         0.001691   0.000001   0.002052
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
            Mass     0.690
            Inertia      0.001219  -0.000212  -0.000135 
                        -0.000212   0.000609  -0.000330 
                        -0.000135  -0.000330   0.001175
            Center_of_Gravity     -0.008163  -0.030597  -0.013125
            Number_of_Contact_Points	0
            MDH_Parameters	 0.0000    -1.57079633    0.0000     0.00000000
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
            Mass    52.007
            Inertia      1.743063  -0.001000   1.776074 
                        -0.001000   6.633693  -0.003620 
                         1.776074  -0.003620   6.146630
            Center_of_Gravity      0.300000   0.000000  -0.092300
            Number_of_Contact_Points	0
            MDH_Parameters	 0.0000    -1.57079633    0.0000     0.00000000
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
                Mass     3.450
                Inertia      0.043505   0.000000   0.000309 
                             0.000000   0.043292   0.000000 
                             0.000309   0.000000   0.001787
                Center_of_Gravity     -0.000431   0.000000   0.096746
                Number_of_Contact_Points	0
                MDH_Parameters	 0.0665    -1.57079633    0.1622     0.00000000
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
                Mass     3.012
                Inertia      0.005830   0.000000   0.000000 
                             0.000000   0.005830   0.000000 
                             0.000000   0.000000   0.003190
                Center_of_Gravity      0.000000   0.000000   0.000000
                Number_of_Contact_Points	0
                MDH_Parameters	 0.0235     1.57079633    0.0000     0.00000000
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
                Mass     3.388
                Inertia      0.020874   0.000000   0.000000 
                             0.000000   0.020874   0.000000 
                             0.000000   0.000000   0.003580
                Center_of_Gravity      0.000000   0.000000  -0.065000
                Number_of_Contact_Points	0
                MDH_Parameters	 0.0160     1.57079633    0.1870     0.00000000
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
                Mass     2.509
                Inertia      0.004460  -0.000000   0.000000 
                            -0.000000   0.004460   0.000000 
                             0.000000   0.000000   0.002650
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
            
            
            RevoluteLink {
                Name    "l_farm"
                Graphics_Model    "meshes/l_farm.xan"
                Mass     3.388
                Inertia      0.020874   0.000000   0.000000 
                             0.000000   0.020874   0.000000 
                             0.000000   0.000000   0.003580
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
                Mass     2.509
                Inertia      0.004460  -0.000000   0.000000 
                            -0.000000   0.004460   0.000000 
                             0.000000   0.000000   0.002650
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
                Mass     1.420
                Inertia      0.011616   0.002080  -0.000002 
                             0.002080   0.005061   0.000002 
                            -0.000002   0.000002   0.013302
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
                Mass     3.450
                Inertia      0.043505   0.000000  -0.000309 
                             0.000000   0.043292   0.000000 
                            -0.000309   0.000000   0.001787
                Center_of_Gravity      0.000431   0.000000   0.096746
                Number_of_Contact_Points	0
                MDH_Parameters	 -0.0665    -1.57079633    0.1622     0.00000000
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
                Mass     3.012
                Inertia      0.005830  -0.000000   0.000000 
                            -0.000000   0.005830   0.000000 
                             0.000000   0.000000   0.003190
                Center_of_Gravity      0.000000   0.000000   0.000000
                Number_of_Contact_Points	0
                MDH_Parameters	 -0.0235     1.57079633    0.0000     0.00000000
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
                Mass     3.388
                Inertia      0.020874   0.000000  -0.000000 
                             0.000000   0.020874   0.000000 
                            -0.000000   0.000000   0.003580
                Center_of_Gravity      0.000000   0.000000   0.065000
                Number_of_Contact_Points	0
                MDH_Parameters	 0.0160     1.57079633    -0.1870     0.00000000
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
                Mass     2.509
                Inertia      0.004460   0.000000   0.000000 
                             0.000000   0.004460   0.000000 
                             0.000000   0.000000   0.002650
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
            
            
            RevoluteLink {
                Name    "r_farm"
                Graphics_Model    "meshes/r_farm.xan"
                Mass     3.388
                Inertia      0.020874   0.000000  -0.000000 
                             0.000000   0.020874   0.000000 
                            -0.000000   0.000000   0.003580
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
                Mass     2.509
                Inertia      0.004460   0.000000   0.000000 
                             0.000000   0.004460   0.000000 
                             0.000000   0.000000   0.002650
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
            Mass     0.648
            Inertia      0.000713  -0.000012   0.000007 
                        -0.000012   0.000757   0.000039 
                         0.000007   0.000039   0.000438
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
            Mass     0.866
            Inertia      0.002266   0.000599  -0.000219 
                         0.000599   0.001471   0.000363 
                        -0.000219   0.000363   0.001786
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
            Mass     9.209
            Inertia      0.020000   0.000000   0.000000 
                         0.000000   0.496117   0.000000 
                         0.000000   0.000000   0.496117
            Center_of_Gravity      0.210000   0.000000   0.000000
            Number_of_Contact_Points	0
            MDH_Parameters	 0.0500    -1.57079633    0.0000     0.00000000
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
            Mass     5.479
            Inertia      0.010005  -0.001975   0.000000 
                        -0.001975   0.268595   0.000000 
                         0.000000   0.000000   0.267601
            Center_of_Gravity      0.187000  -0.001000   0.000000
            Number_of_Contact_Points	0
            MDH_Parameters	 0.3773     0.00000000    0.0000    -0.13290179
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
            Mass     0.125
            Inertia      0.000013  -0.000000   0.000000 
                        -0.000000   0.000010   0.000000 
                         0.000000   0.000000   0.000008
            Center_of_Gravity      0.000000   0.000000   0.000000
            Number_of_Contact_Points	0
            MDH_Parameters	 0.4220     0.00000000    0.0000     0.00000000
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
            Mass     2.050
            Inertia      0.009494   0.000000  -0.003708 
                         0.000000   0.017697   0.000000 
                        -0.003708   0.000000   0.011202
            Center_of_Gravity      0.067000   0.000000   0.027000
            Number_of_Contact_Points	0
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
            Mass     0.648
            Inertia      0.000713   0.000012  -0.000007 
                         0.000012   0.000757   0.000039 
                        -0.000007   0.000039   0.000438
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
            Mass     0.866
            Inertia      0.002266  -0.000599   0.000219 
                        -0.000599   0.001471   0.000363 
                         0.000219   0.000363   0.001786
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
            Mass     9.209
            Inertia      0.020000   0.000000   0.000000 
                         0.000000   0.496117   0.000000 
                         0.000000   0.000000   0.496117
            Center_of_Gravity      0.210000   0.000000   0.000000
            Number_of_Contact_Points	0
            MDH_Parameters	 0.0500    -1.57079633    0.0000     0.00000000
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
            Mass     5.479
            Inertia      0.010005  -0.001975   0.000000 
                        -0.001975   0.268595   0.000000 
                         0.000000   0.000000   0.267601
            Center_of_Gravity      0.187000  -0.001000   0.000000
            Number_of_Contact_Points	0
            MDH_Parameters	 0.3773     0.00000000    0.0000    -0.13290179
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
            Mass     0.125
            Inertia      0.000013  -0.000000   0.000000 
                        -0.000000   0.000010   0.000000 
                         0.000000   0.000000   0.000008
            Center_of_Gravity      0.000000   0.000000   0.000000
            Number_of_Contact_Points	0
            MDH_Parameters	 0.4220     0.00000000    0.0000     0.00000000
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
            Mass     2.050
            Inertia      0.009494   0.000000  -0.003708 
                         0.000000   0.017697   0.000000 
                        -0.003708   0.000000   0.011202
            Center_of_Gravity      0.067000   0.000000   0.027000
            Number_of_Contact_Points	0
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
