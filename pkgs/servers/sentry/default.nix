{ callPackage }:
{
  app = callPackage ./app {};
  relay = callPackage ./relay {};
  symbolic = callPackage ./symbolic {};
}
