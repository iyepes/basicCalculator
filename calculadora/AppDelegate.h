//
//  AppDelegate.h
//  calculadora
//
//  Created by Isabel Yepes on 19/02/15.
//  Licensed by Creative Commons BY 3.0.
//  You can copy but please attribute the work.
//

#import <UIKit/UIKit.h>
#import "memoryModel.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) memoryModel  *calculatorMemoryModel;

@end

