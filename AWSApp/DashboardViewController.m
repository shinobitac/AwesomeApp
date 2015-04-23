//
//  DashboardViewController.m
//  AWSApp
//
//  Created by TNMacBook on 15/04/15.
//  Copyright (c) 2015 TNMacBook. All rights reserved.
//

#import "DashboardViewController.h"
#import "MapaViewController.h"

@interface DashboardViewController ()

@end

@implementation DashboardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
   

    
    if([segue.identifier isEqualToString:@"showMapa"])
    {
        
        NSLog(@"preprareForSegue: %@", segue.identifier);
        MapaViewController *mapa = segue.destinationViewController;
        
        
        mapa.mensaje = @"Este mensaje aparecera en la pantalla del mapa.";
        
        UIAlertView *alerta =[[UIAlertView alloc] initWithTitle:@"Mi alerta" message:mapa.mensaje delegate:self cancelButtonTitle:@"Cancelado" otherButtonTitles:nil];
        [alerta show];
        
        
    }

}

@end
