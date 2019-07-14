
let ax, ay;
let context = {};

let FPScounter = function()
{
	this.count = 0;
	this.pre_time = Date.now();
	this.frame = 0;
	this.update = function() {
		this.count++;
		let time = Date.now();
		if(time > this.pre_time + 1000){
			this.pre_time = time;
			this.frame = this.count;
			this.count = 0;
		}
	}
	this.get = function() {
		return this.frame;
	}
};

const fps = new FPScounter();

function polyshadingvblank_init()
{
	ax = 29; ay = 324;

	let cvs = document.getElementById('polyshadingvblank');
	cvs.addEventListener('mousemove', onMove, false);
	cvs.addEventListener('mousedown', onClick, false);
	let ctx = cvs.getContext('2d');
	context["shadingvblank"] = ctx;

	polyshadingvblank();
}

let Vertex = function()
{
	function Vertex(x, y, z, col) {
		this.x = x;
		this.y = y;
		this.z = z;
		this.col = col;
	};
	return Vertex;
}();

let Plane = function()
{
	function Plane(v1, v2, v3) {
		this.v = new Array(3);
		this.v[0] = v1;
		this.v[1] = v2;
		this.v[2] = v3;
	};
	return Plane;
}();

function rotate_X(v, a)
{
	let r = a * Math.PI / 180;
	let rv = new Vertex();
	rv.x = v.x;
	rv.y = v.y * Math.cos(r) - v.z * Math.sin(r);
	rv.z = v.y * Math.sin(r) + v.z * Math.cos(r);
	return rv;
}

function rotate_Y(v, a)
{
	let r = a * Math.PI / 180;
	let rv = new Vertex();
	rv.x = v.x * Math.cos(r) - v.z * Math.sin(r);
	rv.y = v.y;
	rv.z = v.x * Math.sin(r) + v.z * Math.cos(r);
	return rv;
}

function geometry(tri, men)
{
	// geometry translation
	for(let m=0; m<men; m++){
		for(let v=0; v<3; v++){
			let rxv = rotate_X(tri[m].v[v], ax);
			let ryv = rotate_Y(rxv, ay);
			ryv.col = tri[m].v[v].col;
			tri[m].v[v] = ryv;

			// move to center
			tri[m].v[v].x += 320;
			tri[m].v[v].y += 240;
		}
	}
}

function zsort(tri, men)
{
	let mp = new Array(men);
	
	let z = new Array(men);
	for(let m=0; m<men; m++){
		z[m] = tri[m].v[0].z + tri[m].v[1].z + tri[m].v[2].z;
		mp[m] = m;
	}

	for(let j=0; j<men-1; j++){
		for(let i=j+1; i<men; i++){
			if(z[i]>z[j]){
				let zt = z[i]; z[i] = z[j]; z[j] = zt;
				let mpt = mp[i]; mp[i] = mp[j]; mp[j] = mpt;
			}
		}
	}

	return mp;
}

function polyshadingvblank()
{
	const vA = new Vertex(-90, -90,  90, 0xFF4444);
	const vB = new Vertex( 90, -90, -90, 0xFFFF44);
	const vC = new Vertex(-90,  90, -90, 0x44FF44);
	const vD = new Vertex( 90,  90,  90, 0x4444FF);

	const men = 4;
	let tri = new Array(men);
	tri[0] = new Plane(vA, vB, vC);
	tri[1] = new Plane(vB, vD, vC);
	tri[2] = new Plane(vA, vD, vB); // 時計回り
	tri[3] = new Plane(vA, vC, vD); // 時計回り

	geometry(tri, men);

	// z sort
	let mp = new Array(men);
	mp = zsort(tri, men);

	let ctx = context["shadingvblank"];
	let img_data = ctx.createImageData(640, 480);

	// background
	for(let y=0; y<480; y++){
		const col = 0xFF - y / 2;
		for(let x=0; x<640; x++){
			const pos = (y * 640 + x) * 4;
			img_data.data[pos + 0] = col;
			img_data.data[pos + 1] = col;
			img_data.data[pos + 2] = col;
			img_data.data[pos + 3] = 0xFF; // dont transparent
		}
	}

	for(let p=1; p<men; p++){
		const m = mp[p];

		let x1 = tri[m].v[0].x, y1 = tri[m].v[0].y, c1 = tri[m].v[0].col;
		let x2 = tri[m].v[1].x, y2 = tri[m].v[1].y, c2 = tri[m].v[1].col;
		let x3 = tri[m].v[2].x, y3 = tri[m].v[2].y, c3 = tri[m].v[2].col;

		// 頂点入れ替え
		if(y1 > y2){
			const xt=x1; x1=x2; x2=xt;
			const yt=y1; y1=y2; y2=yt;
			const ct=c1; c1=c2; c2=ct;
		}
		if(y1 > y3){
			const xt=x1; x1=x3; x3=xt;
			const yt=y1; y1=y3; y3=yt;
			const ct=c1; c1=c3; c3=ct;
		}
		if(y2 > y3){
			const xt=x2; x2=x3; x3=xt;
			const yt=y2; y2=y3; y3=yt;
			const ct=c2; c2=c3; c3=ct;
		}

		// 色分解
		const r1=c1>>16, g1=(c1>>8)&0xFF, b1=c1&0xFF;
		const r2=c2>>16, g2=(c2>>8)&0xFF, b2=c2&0xFF;
		const r3=c3>>16, g3=(c3>>8)&0xFF, b3=c3&0xFF;

		const ax12 = (x2-x1) / (y2-y1);
		const ax13 = (x3-x1) / (y3-y1);
		const ax23 = (x3-x2) / (y3-y2);

		let x12 = x1, x13 = x1, x23 = x2;

		const ar12 = (r2-r1) / (y2-y1);
		const ag12 = (g2-g1) / (y2-y1);
		const ab12 = (b2-b1) / (y2-y1);
		const ar13 = (r3-r1) / (y3-y1);
		const ag13 = (g3-g1) / (y3-y1);
		const ab13 = (b3-b1) / (y3-y1);
		const ar23 = (r3-r2) / (y3-y2);
		const ag23 = (g3-g2) / (y3-y2);
		const ab23 = (b3-b2) / (y3-y2);

		let r12 = r1, g12 = g1, b12 = b1;
		let r13 = r1, g13 = g1, b13 = b1;
		let r23 = r2, g23 = g2, b23 = b2;

		const sy = y1, ey = y3;

		const eval = (y3-y1) * (x2-x1) - (x3-x1) * (y2-y1);

		for(let y=Math.round(sy); y<=Math.round(ey); y++){ // ok
	
			let sx, ex;
			let sr, sg, sb;
			let er, eg, eb;
			if(eval<0){ // 左に凸
				if(y<=y2 && y1!=y2){
					sx = x12; sr = r12; sg = g12; sb = b12;
				}
				else{
					sx = x23; sr = r23; sg = g23; sb = b23;
				}
				ex = x13; er = r13; eg = g13; eb = b13;
			}
			else{ // 右に凸
				sx = x13; sr = r13; sg = g13; sb = b13;
				if(y<=y2 && y1!=y2){
					ex = x12; er = r12; eg = g12; eb = b12;
				}
				else{
					ex = x23; er = r23; eg = g23; eb = b23;
				}
			}

			if(y<=y2 && y1!=y2){
				x12 += ax12;
				r12 += ar12;
				g12 += ag12;
				b12 += ab12;
			}
			else{
				x23 += ax23;
				r23 += ar23;
				g23 += ag23;
				b23 += ab23;
			}
			x13 += ax13;
			r13 += ar13;
			g13 += ag13;
			b13 += ab13;

			let ar = (er - sr) / (ex - sx);
			let ag = (eg - sg) / (ex - sx);
			let ab = (eb - sb) / (ex - sx);

			let pr = sr, pg = sg, pb = sb;
	
			for(let x=Math.round(sx); x<Math.round(ex); x++){
				const pos = (y * 640 + x) * 4;
				img_data.data[pos + 0] = pr; // 赤 red
				img_data.data[pos + 1] = pg; // 緑 green
				img_data.data[pos + 2] = pb; // 青 blue
			//	img_data.data[pos + 3] = 0xFF; // 非透明度 alpha
				pr += ar;
				pg += ag;
				pb += ab;
			}
		}
	}

	ctx.putImageData(img_data, 0, 0);

	fps.update();
	ctx.font = "20px Arial";
	ctx.fillStyle = "blue";//"white";
	ctx.fillText(fps.get()+" fps", 570, 30);
}

let px, py;
let callbackId;

function onClick(e)
{
	if(e.button==0){
		let rect = e.target.getBoundingClientRect();
		px = ~~(e.clientX - rect.left);
		py = ~~(e.clientY - rect.top);
		// アニメーション停止
		cancelAnimationFrame(callbackId);
	}
}

function onMove(e)
{
	if(e.buttons==1 || e.witch==1){
		let rect = e.target.getBoundingClientRect();
		ax += ~~(e.clientY - rect.top) - py;
		ay += ~~(e.clientX - rect.left) - px;
		if(ax<0) ax += 360;
		else if(ax>=360) ax -= 360;
		if(ay<0) ay += 360;
		else if(ay>=360) ay -= 360;
		px = ~~(e.clientX - rect.left);
		py = ~~(e.clientY - rect.top);
		polyshadingvblank();
	}
}

function roll()
{
	ax += 4;
	ay += 3;
	if(ax>=360) ax -= 360;
	if(ay>=360) ay -= 360;
	polyshadingvblank();
	// アニメーション
	callbackId = requestAnimationFrame(roll);
}
