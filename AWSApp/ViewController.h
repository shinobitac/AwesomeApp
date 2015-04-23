//
//  ViewController.h
//  AWSApp
//
//  Created by TNMacBook on 15/04/15.
//  Copyright (c) 2015 TNMacBook. All rights reserved.
//IB
//CATALOGOoutlet: CATALOGO DE REFERENCIAS ENTRE NOMBRE
#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *btnLogin;
@property (weak, nonatomic) IBOutlet UITextField *txtUsuario;
@property (weak, nonatomic) IBOutlet UITextField *txtPassword;
@property (weak, nonatomic) IBOutlet UISwitch *sw_recordar_sesion;

@end

