//
//  memoryModel.m
//  calculadora
//
//  Created by Isabel Yepes on 19/02/15.
//  Licensed by Creative Commons BY 3.0.
//  You can copy but please attribute the work.
//

#import "memoryModel.h"

@implementation memoryModel


-(id) init {
    
    if (self = [super init] ) {

    }
    return self;
}

@synthesize inputData;
@synthesize memoryData;
@synthesize previousData;
@synthesize resultData;
@synthesize operator;

@end

