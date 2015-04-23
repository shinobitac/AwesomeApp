//
//  ViewController.m
//  AWSApp
//
//  Created by TNMacBook on 15/04/15.
//  Copyright (c) 2015 TNMacBook. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@end

@implementation ViewController
@synthesize txtUsuario;
@synthesize txtPassword;
@synthesize sw_recordar_sesion;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)viewDidAppear
{

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)bntLogin:(id)sender;
{
    NSString *sUsuario=txtUsuario.text;
    NSString *sPassword=txtPassword.text;
    BOOL *swRecordarSesion=sw_recordar_sesion.isOn;
    
    
    //ESTE PARA UN REQUEST DE TIPO GET
    NSString *sUrlWsLogin=[NSString stringWithFormat:@"http://192.168.6.90:52/VallenMapsMovilBOMobileAccess/login/iniciarSesionMobile?login_usuario=%@&login_password=%@",sUsuario,sPassword];
    
    //ESTE PARA UN REQUEST DE TIPO POST
   /* NSString *sUrlWsLoginPost=[NSString stringWithFormat:@"http://192.168.6.90:52/VallenMapsMovilBOMobileAccess/login/iniciarSesionMobile"];
    */
    
    UIAlertView *alerta =[[UIAlertView alloc] initWithTitle:@"Mi alerta" message:txtUsuario.text delegate:self cancelButtonTitle:@"Cancelar" otherButtonTitles:nil];
    [alerta show];
    
    UIAlertView *noRecordarSesion =[[UIAlertView alloc] initWithTitle:@"Mi alerta" message:@"No activaste el maldito recordar sesion asi que no pasas" delegate:self cancelButtonTitle:@"Cancelar" otherButtonTitles:nil];
    
    
    
    if (swRecordarSesion) {
        //ESTE ES PARA UN REQUEST DE TIPO DE GET
        NSURL *url=[NSURL URLWithString:sUrlWsLogin];
        NSURLRequest *request=[NSURLRequest requestWithURL:url];
        
        [NSURLConnection sendAsynchronousRequest:request
                                           queue:[NSOperationQueue mainQueue]
                               completionHandler:^(NSURLResponse *response,NSData *data,NSError *connectionError)
        
         
         //ESTE ES PARA UN REQUEST DE TIPO DE POST
         /*NSString *postData = [NSString stringWithFormat:@"login_usuario=%@&login_password=%@",txtUsuario.text,txtPassword.text];
         
         NSURL *urlPost=[NSURL URLWithString:sUrlWsLoginPost];
         NSMutableURLRequest *requestmutable=[NSMutableURLRequest requestWithURL:urlPost];
         [requestmutable setHTTPMethod:@"POST"];
         [requestmutable setHTTPBody:[postData dataUsingEncoding: NSUTF8StringEncoding]];
         
         [NSURLConnection sendAsynchronousRequest:request
                                            queue:[NSOperationQueue mainQueue]
                                completionHandler:^(NSURLResponse *response,NSData *data,NSError *connectionError)
          
*/
         {
             
             if(data.length > 0 && connectionError ==nil)
             {
                 
                 
                 NSDictionary *loginData = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
                 if([[loginData valueForKey:@"estatus"] isEqualToString:@"EXITO"]
                    
                    )
                     
                 {
                     
                     NSLog([loginData valueForKey:@"descripcion"]);
                     
                     
                     [self performSegueWithIdentifier:@"showDashboard" sender:self];
                     
                 }
             }
             
         }];
        
        
    }
    else{
        [ noRecordarSesion show];
    }
    
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [txtUsuario endEditing:TRUE];
}
@end
