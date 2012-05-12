#import "MTDFunctions.h"


void MTDDirectionsOpenInMapsApp(CLLocationCoordinate2D fromCoordinate, CLLocationCoordinate2D toCoordinate, MTDDirectionsRouteType routeType) {
	NSString *googleMapsURL = [NSString stringWithFormat:@"http://maps.google.com/maps?saddr=%f,%f&daddr=%f,%f",
							   fromCoordinate.latitude,fromCoordinate.longitude, toCoordinate.latitude, toCoordinate.longitude];
    
    switch(routeType) {
        case MTDDirectionsRouteTypePedestrian:
        case MTDDirectionsRouteTypeBicycle: {
            googleMapsURL = [googleMapsURL stringByAppendingString:@"&dirflg=w"];
            break;
        }
            
        case MTDDirectionsRouteTypePedestrianIncludingPublicTransport: {
            googleMapsURL = [googleMapsURL stringByAppendingString:@"&dirflg=r"];
            break;
        }
            
        case MTDDirectionsRouteTypeFastestDriving:
        case MTDDirectionsRouteTypeShortestDriving:
        default: {
            // do nothing
            break;
        }
    }
    
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:googleMapsURL]];
}
