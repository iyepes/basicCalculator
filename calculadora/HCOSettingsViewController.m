//
//  HCOSettingsViewController.m
//  calculadora
//
//  Created by Isabel Yepes on 20/02/15.
//  Licensed by Creative Commons BY 3.0.
//  You can copy but please attribute the work.
//

#import "HCOSettingsViewController.h"
#import "ViewController.h"

@interface HCOSettingsViewController ()

@property (weak, nonatomic) IBOutlet UISlider *redSlider;

@property (weak, nonatomic) IBOutlet UISlider *greenSlider;

@property (weak, nonatomic) IBOutlet UISlider *blueSlider;

@property (weak, nonatomic) IBOutlet UISlider *alphaSlider;

@end

@implementation HCOSettingsViewController



- (IBAction)redChanged:(UISlider *)sender {
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    CGFloat redDefault = sender.value/255;
    [defaults setFloat:redDefault forKey:@"redDefault"];
    CGFloat greenDefault = [defaults floatForKey:@"greenDefault"];
    CGFloat blueDefault = [defaults floatForKey:@"blueDefault"];
    CGFloat alphaDefault = [defaults floatForKey:@"alphaDefault"];
    UIColor *backColor = [[UIColor alloc] initWithRed:redDefault green:greenDefault blue:blueDefault alpha:alphaDefault];
    self.view.backgroundColor = backColor;
    
}

- (IBAction)greenChanged:(UISlider *)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    CGFloat greenDefault = sender.value/255;
    [defaults setFloat:greenDefault forKey:@"greenDefault"];
    CGFloat redDefault = [defaults floatForKey:@"redDefault"];
    CGFloat blueDefault = [defaults floatForKey:@"blueDefault"];
    CGFloat alphaDefault = [defaults floatForKey:@"alphaDefault"];
    UIColor *backColor = [[UIColor alloc] initWithRed:redDefault green:greenDefault blue:blueDefault alpha:alphaDefault];
    self.view.backgroundColor = backColor;
    
}

- (IBAction)blueChanged:(UISlider *)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    CGFloat blueDefault = sender.value/255;
    [defaults setFloat:blueDefault forKey:@"blueDefault"];
    CGFloat redDefault = [defaults floatForKey:@"redDefault"];
    CGFloat greenDefault = [defaults floatForKey:@"greenDefault"];
    CGFloat alphaDefault = [defaults floatForKey:@"alphaDefault"];
    UIColor *backColor = [[UIColor alloc] initWithRed:redDefault green:greenDefault blue:blueDefault alpha:alphaDefault];
    self.view.backgroundColor = backColor;
}

- (IBAction)alphaChanged:(UISlider *)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    CGFloat alphaDefault = sender.value/255;
    CGFloat redDefault = [defaults floatForKey:@"redDefault"];
    CGFloat blueDefault = [defaults floatForKey:@"blueDefault"];
    CGFloat greenDefault = [defaults floatForKey:@"greenDefault"];
    if (alphaDefault<0.5f) {
        alphaDefault = 0.5f;
    }
    [defaults setFloat:alphaDefault forKey:@"alphaDefault"];
    if (redDefault==0 && greenDefault==0 && blueDefault==0) {
        redDefault = 1.0f;
        [defaults setFloat:redDefault forKey:@"redDefault"];
        blueDefault = 1.0f;
        [defaults setFloat:blueDefault forKey:@"blueDefault"];
    }
    UIColor *backColor = [[UIColor alloc] initWithRed:redDefault green:greenDefault blue:blueDefault alpha:alphaDefault];
    self.view.backgroundColor = backColor;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    CGFloat redDefault = [defaults floatForKey:@"redDefault"];
    self.redSlider.value = redDefault*255;
    CGFloat greenDefault = [defaults floatForKey:@"greenDefault"];
    self.greenSlider.value = greenDefault*255;
    CGFloat blueDefault = [defaults floatForKey:@"blueDefault"];
    self.blueSlider.value = blueDefault*255;
    CGFloat alphaDefault = [defaults floatForKey:@"alphaDefault"];
    self.alphaSlider.value = alphaDefault*255;
    UIColor *backColor = [[UIColor alloc] initWithRed:redDefault green:greenDefault blue:blueDefault alpha:alphaDefault];
    self.view.backgroundColor = backColor;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{

    ViewController *previousVC = segue.destinationViewController;
    
    if ([segue.identifier isEqualToString: @"doneSettingsSegue"]) {
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        CGFloat redDefault = [defaults floatForKey:@"redDefault"];
        CGFloat blueDefault = [defaults floatForKey:@"blueDefault"];
        CGFloat greenDefault = [defaults floatForKey:@"greenDefault"];
        CGFloat alphaDefault = [defaults floatForKey:@"alphaDefault"];
        UIColor *backColor = [[UIColor alloc] initWithRed:redDefault green:greenDefault blue:blueDefault alpha:alphaDefault];
        previousVC.view.backgroundColor = backColor;
    }
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
