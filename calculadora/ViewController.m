//
//  ViewController.m
//  calculadora
//
//  Created by Isabel Yepes on 19/02/15.
//  Licensed by Creative Commons BY 3.0.
//  You can copy but please attribute the work.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "GlobalParameters.h"

@interface ViewController (){
}

@property (weak, nonatomic) IBOutlet UITextField *inputField;

@end


@implementation ViewController
@synthesize calculatorMemoryModel;

-(id) init {
    if (self = [super init] ) {
        
    }
    return self;
}


-(int) solution:(NSMutableArray *)A {
    //this is here because of an assesment I was solving online to
    //find an equilibrium point in an array
    
    int i;
    int j;
    long long lowerSum = 0;
    long long upperSum = 0;
    if ([A count]<1) {
        return -1;
    }
    
    for (i=1; i < [A count]-1; i++) {
        lowerSum = 0;
        upperSum = 0;
        for (j=0; j < i; j++){
            lowerSum = lowerSum + [A[j] longLongValue];
            //NSLog(@"lowerSum %d A-j %@",lowerSum, A[j]);
        }
        for (j=i+1; j < [A count]; j++) {
            upperSum = upperSum + [A[j] longLongValue];
            //NSLog(@"upperSum %d A-j %@",upperSum, A[j]);
        }
        if (upperSum == lowerSum) {
            return i;
        }
    }
    lowerSum = 0;
    for (i=0; i < [A count]; i++) {
        lowerSum = lowerSum + [A[i] longLongValue];
    }
    if (lowerSum == 0) {
        return [A count]-1;
    } else {
        upperSum = 0;
        for (i=1; i < [A count]; i++) {
            upperSum = upperSum + [A[i] longLongValue];
        }
        if (upperSum == [A[0] longLongValue]) {
            return 0;
        } else {
            return -1;
        }
    }
    
}


-(int) Champernowne {
    int result;
    NSMutableString *digits = @"123456789010";
    result = 1;
    int i = 11;
    long count = [digits length];
    BOOL keepAdding = false;
    while (keepAdding) {
        [digits appendString:[NSString stringWithFormat:@"%d",i ]];
        if (count >= 100) {
          
        }
    }

    return result;
}


- (IBAction)tapOnScreen:(UITapGestureRecognizer *)sender {
    [self.view endEditing:YES];
}

- (IBAction)plusButton:(UIButton *)sender {
    calculatorMemoryModel.previousData = calculatorMemoryModel.inputData;
    calculatorMemoryModel.operator = Addition;
    self.inputField.text = @"";
}

- (IBAction)lessButton:(UIButton *)sender {
    calculatorMemoryModel.previousData = calculatorMemoryModel.inputData;
    calculatorMemoryModel.operator = Subtraction;
    self.inputField.text = @"";
}

- (IBAction)multiplyButton:(UIButton *)sender {
    calculatorMemoryModel.previousData = calculatorMemoryModel.inputData;
    calculatorMemoryModel.operator = Multiplication;
    self.inputField.text = @"";
}

- (IBAction)divideButton:(UIButton *)sender {
    calculatorMemoryModel.previousData = calculatorMemoryModel.inputData;
    calculatorMemoryModel.operator = Division;
    self.inputField.text = @"";
}

- (IBAction)equalButton:(UIButton *)sender {
    if (calculatorMemoryModel.operator == Addition) {
        calculatorMemoryModel.inputData = calculatorMemoryModel.previousData
        + calculatorMemoryModel.inputData;
        calculatorMemoryModel.previousData = 0;
        self.inputField.text = [NSString stringWithFormat:@"%f", calculatorMemoryModel.inputData];
    } else if (calculatorMemoryModel.operator == Subtraction) {
        calculatorMemoryModel.inputData = calculatorMemoryModel.previousData
        - calculatorMemoryModel.inputData;
        calculatorMemoryModel.previousData = 0;
        self.inputField.text = [NSString stringWithFormat:@"%f", calculatorMemoryModel.inputData];
    } else if (calculatorMemoryModel.operator == Multiplication) {
        calculatorMemoryModel.inputData = calculatorMemoryModel.previousData
        * calculatorMemoryModel.inputData;
        calculatorMemoryModel.previousData = 0;
        self.inputField.text = [NSString stringWithFormat:@"%f", calculatorMemoryModel.inputData];
    } else if (calculatorMemoryModel.operator == Division) {
        calculatorMemoryModel.inputData = calculatorMemoryModel.previousData
        / calculatorMemoryModel.inputData;
        calculatorMemoryModel.previousData = 0;
        self.inputField.text = [NSString stringWithFormat:@"%f", calculatorMemoryModel.inputData];
    }
}

- (IBAction)memoryStore:(UIButton *)sender {
    calculatorMemoryModel.memoryData = calculatorMemoryModel.memoryData + [self.inputField.text floatValue];
    NSNumber *numberToStore = [NSNumber numberWithFloat:calculatorMemoryModel.memoryData];
    self.inputField.text = @"";
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:numberToStore forKey:@"memoryData"];
    [defaults synchronize];
    }

- (IBAction)memoryClear:(UIButton *)sender {
    calculatorMemoryModel.memoryData = 0;
}

- (IBAction)memoryRecall:(UIButton *)sender {
    self.inputField.text = [NSString stringWithFormat:@"%f", calculatorMemoryModel.memoryData];
}

- (IBAction)storeTypedNumbers:(id)sender {
    calculatorMemoryModel.inputData = [self.inputField.text floatValue];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    AppDelegate *mainDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    calculatorMemoryModel = mainDelegate.calculatorMemoryModel;
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    CGFloat redDefault = [defaults floatForKey:@"redDefault"];
    CGFloat greenDefault = [defaults floatForKey:@"greenDefault"];
    CGFloat blueDefault = [defaults floatForKey:@"blueDefault"];
    CGFloat alphaDefault = [defaults floatForKey:@"alphaDefault"];
    if (alphaDefault==0) {
        alphaDefault = 0.5f;
        [defaults setFloat:alphaDefault forKey:@"alphaDefault"];
    }
    if (redDefault==0 && greenDefault==0 && blueDefault==0) {
        redDefault = 1.0f;
        [defaults setFloat:redDefault forKey:@"redDefault"];
        blueDefault = 1.0f;
        [defaults setFloat:blueDefault forKey:@"blueDefault"];
    }
    
    UIColor *backColor = [[UIColor alloc] initWithRed:redDefault green:greenDefault blue:blueDefault alpha:alphaDefault];
    self.view.backgroundColor = backColor;

    NSNumber *memoryData = [defaults objectForKey:@"memoryData"];
    calculatorMemoryModel.memoryData = [memoryData floatValue];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)viewWillAppear:(BOOL)animated {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    CGFloat redDefault = [defaults floatForKey:@"redDefault"];
    CGFloat blueDefault = [defaults floatForKey:@"blueDefault"];
    CGFloat greenDefault = [defaults floatForKey:@"greenDefault"];
    CGFloat alphaDefault = [defaults floatForKey:@"alphaDefault"];
    UIColor *backColor = [[UIColor alloc] initWithRed:redDefault green:greenDefault blue:blueDefault alpha:alphaDefault];
    self.view.backgroundColor = backColor;

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
