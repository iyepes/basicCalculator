//
//  memoryModel.h
//  calculadora
//
//  Created by Isabel Yepes on 19/02/15.
//  Licensed by Creative Commons BY 3.0.
//  You can copy but please attribute the work.
//

#import <Foundation/Foundation.h>

@interface memoryModel : NSObject

@property(nonatomic,readwrite) float inputData;
@property(nonatomic,readwrite) float previousData;
@property(nonatomic,readwrite) float resultData;
@property(nonatomic,readwrite) float memoryData;
@property(nonatomic,readwrite) int operator;

@end
