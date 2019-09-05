
class Rotator {
  PVector location;
  PVector velocity;
  PVector focus;
  PVector dir;
  PVector acceleration;
  float angle;
  float topspeed;
  float size = 50;
  
  Rotator (float x, float y) {
    velocity = new PVector (0, 0);
    location = new PVector (x, y);
    acceleration = new PVector (0, 0);
    topspeed = .001;
  }
  
  void update() {
    focus = new PVector(0, 0);
    dir = PVector.sub(focus, location);
    dir.normalize();
    dir.mult(0.5);
    this.acceleration = dir;
    
    this.velocity.add(this.acceleration);
    this.velocity.limit(this.topspeed);
    this.location.add(this.velocity);
    
  }
  
  void display(float speeding) {
    angle = velocity.heading();
    rotate(speeding);
    pushMatrix();
    translate(location.x, location.y);
    rotate(angle+PI*-1);
    stroke(0);
    strokeWeight(1);
    fill(255);
    triangle( size, -size/2, size, size/2, 0, 0);
    popMatrix();
  }
  
}