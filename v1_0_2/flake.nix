{
  description = ''Port of c++ glm library with shader-like syntax'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-glm-v1_0_2.flake = false;
  inputs.src-glm-v1_0_2.owner = "stavenko";
  inputs.src-glm-v1_0_2.ref   = "refs/tags/v1.0.2";
  inputs.src-glm-v1_0_2.repo  = "nim-glm";
  inputs.src-glm-v1_0_2.type  = "github";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-glm-v1_0_2"];
  in lib.mkRefOutput {
    inherit self nixpkgs ;
    src  = deps."src-glm-v1_0_2";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  };
}