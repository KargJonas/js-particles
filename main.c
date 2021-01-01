// #include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define PARTICLE_COUNT 100
#define BOUNDS_X 500
#define BOUNDS_Y 500

struct Vector {
  float x;
  float y;
};

struct Particle {
  struct Vector position;
  struct Vector velocity;
};

struct Particle particles[PARTICLE_COUNT];

int main(int argc, char ** argv) {
  time_t current_time;
  srand((unsigned)time(&current_time));
}

void initializeParticleSystem() {
  for (int i = 0; i < PARTICLE_COUNT; i++) {    
    struct Vector initialPosition = {
      rand() % BOUNDS_X,
      rand() % BOUNDS_Y
    };

    struct Vector initialVelocity = {
      (rand() % 100 - 50) / 25.0,
      (rand() % 100 - 50) / 25.0
    };

    struct Particle newParticle = {
      initialPosition,
      initialVelocity
    };

    particles[i] = newParticle;
  }
}

struct Particle *getParticles() {
  return particles;
}