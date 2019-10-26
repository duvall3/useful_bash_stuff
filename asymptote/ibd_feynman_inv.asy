// ibd_feynman_tattoo.asy -- Asymptote macro to draw Feynman diagram of inverse beta decay
// -- adapted from example eetomumu.asy on Asymptote project's web site
// -- labels and time arrow removed
// -- colors inverted


// setup
import feynman;
settings.outformat="eps";
settings.render=16;
defaultpen(fontsize(64pt));
currentpen = linewidth(1.0)+gray(1);
size(15.0cm,0);//,IgnoreAspect);
fmdefaults();
overpaint = false;


// define points
real L = 50;

// main diagram:
pair zl = (-0.75*L,0);
pair zr = (+0.75*L,0);

pair xu = zl + L*dir(+120);
pair xl = zl + L*dir(-120);

pair yu = zr + L*dir(+60);
pair yl = zr + L*dir(-60);

// bg
path BG = xu--xl--shift(+0.2*L,0)*(yl--yu)--cycle;
filldraw(BG,black);

// for quarks:
pen q = currentpen+linewidth(0.65);
path q1a = shift(+0.1*L,0) * (yl--zr);
path q1b = shift(+0.1*L,0) * (zr--yu);
path q2a = shift(+0.2*L,0) * (yl--zr);
path q2b = shift(+0.2*L,0) * (zr--yu);

// draw vertices and propagators

drawFermion(zl--xl);
drawFermion(xu--zl);

drawFermion(q1a,q);
drawFermion(q1b,q);
drawFermion(q2a,q);
drawFermion(q2b,q);

drawPhoton(zl--zr);

drawFermion(zr--yu,q);
drawFermion(yl--zr,q); 
drawVertex(zl);
drawVertex(zr);


// all pau!   )
