function fav(self) {
	 		 	var x = document.getElementsByClassName('petition_category');
	 		for (i=0; i<x.length; i++) {
	 			x[i].style.display='none';
	 		}	
	 		document.getElementsByClassName('petition-fav')[0].style.display='block';
	 		var y = document.getElementsByClassName('petition_li');
	 		for (z=0; z<y.length; z++) {
	 			y[z].style.borderColor="#adacad";
	 			y[z].style.color="#333";

	 		}
	 		self.style.borderColor='#EC2C22';
	 		self.style.color='#EC2C22';
	 			document.getElementById('sub-user').style.display='none';
	 			document.getElementById('sub-popular').style.display='none';
	 		
	 	}
	 	function popular(self) {
	 		 	var x = document.getElementsByClassName('petition_category');
	 		for (i=0; i<x.length; i++) {
	 			x[i].style.display='none';
	 		}	
	 		document.getElementsByClassName('petition-popular-today')[0].style.display='block';
	 			var y = document.getElementsByClassName('petition_li');
	 		for (z=0; z<y.length; z++) {
	 			y[z].style.borderColor="#adacad";
	 			y[z].style.color="#333";

	 		}
	 		self.style.borderColor='#EC2C22';
	 		self.style.color='#EC2C22';
	 			document.getElementById('sub-user').style.display='none';
	 			document.getElementById('sub-popular').style.display='block';
	 	}
	 //sub menu popular start
	 	function populartoday(self) {
	 		 	var z=document.getElementsByClassName('sub-popular-li');
	 			for (i=0; i<z.length; i++) {
	 			z[i].style.backgroundColor='#FFF';
	 			z[i].style.color='#333';	 			
	 		}	
	 		var x = document.getElementsByClassName('petition_category');
	 		for (i=0; i<x.length; i++) {
	 			x[i].style.display='none';
	 		}	
	 		document.getElementsByClassName('petition-popular-today')[0].style.display='block';
	 		self.style.color="#FFF";
	 		self.style.backgroundColor="#adacad";

	 		
	 	}	
	 	 	function popularweek(self) {
	 		 	var z=document.getElementsByClassName('sub-popular-li');
	 			for (i=0; i<z.length; i++) {
	 			z[i].style.backgroundColor='#FFF';
	 			z[i].style.color='#333';	 			
	 		}	
	 		var x = document.getElementsByClassName('petition_category');
	 		for (i=0; i<x.length; i++) {
	 			x[i].style.display='none';
	 		}	

	 		document.getElementsByClassName('petition-popular-week')[0].style.display='block';
	 		self.style.color="#FFF";
	 		self.style.backgroundColor="#adacad";

	 		
	 	}	
	 	 	function popularwhole(self) {
	 		 	var z=document.getElementsByClassName('sub-popular-li');
	 			for (i=0; i<z.length; i++) {
	 			z[i].style.backgroundColor='#FFF';
	 			z[i].style.color='#333';	 			
	 		}	
	 		var x = document.getElementsByClassName('petition_category');
	 		for (i=0; i<x.length; i++) {
	 			x[i].style.display='none';
	 		}	
	 		document.getElementsByClassName('petition-popular-whole')[0].style.display='block';
	 		self.style.color="#FFF";
	 		self.style.backgroundColor="#adacad";
	 		}
	 			 	//sub menu popular end
	 	function last(self) {
	 		 	var x = document.getElementsByClassName('petition_category');
	 		for (i=0; i<x.length; i++) {
	 			x[i].style.display='none';
	 		}	
 		document.getElementsByClassName('petition-last')[0].style.display='block';
	 			var y = document.getElementsByClassName('petition_li');
	 		for (z=0; z<y.length; z++) {
	 			y[z].style.borderColor="#adacad";
	 			y[z].style.color="#333";

	 		}
	 		self.style.borderColor='#EC2C22';
	 		self.style.color='#EC2C22';
	 			document.getElementById('sub-user').style.display='none';
	 			document.getElementById('sub-popular').style.display='none';
	 	}
	 	function my(self) {
	 		 	var x = document.getElementsByClassName('petition_category');
	 		for (i=0; i<x.length; i++) {
	 			x[i].style.display='none';
	 		}	
	 		document.getElementsByClassName('petition-my-all')[0].style.display='block';
	 			var y = document.getElementsByClassName('petition_li');
	 		for (z=0; z<y.length; z++) {
	 			y[z].style.borderColor="#adacad";
	 			y[z].style.color="#333";

	 		}
	 		self.style.borderColor='#EC2C22';
	 		self.style.color='#EC2C22';
	 			document.getElementById('sub-user').style.display='block';
	 			document.getElementById('sub-popular').style.display='none';
	 	}
	 	//sub meny user start
	 		function myall(self) {
	 		 	var z=document.getElementsByClassName('sub-user-li');
	 			for (i=0; i<z.length; i++) {
	 			z[i].style.backgroundColor='#FFF';
	 			z[i].style.color='#333';	 			
	 		}	
	 		var x = document.getElementsByClassName('petition_category');
	 		for (i=0; i<x.length; i++) {
	 			x[i].style.display='none';
	 		}	
	 		document.getElementsByClassName('petition-my-all')[0].style.display='block';
	 		self.style.color="#FFF";
	 		self.style.backgroundColor="#adacad";

	 	}
	 	function myown(self) {
	 		 	var z=document.getElementsByClassName('sub-user-li');
	 			for (i=0; i<z.length; i++) {
	 			z[i].style.backgroundColor='#FFF';
	 			z[i].style.color='#333';	 			
	 		}	
	 		var x = document.getElementsByClassName('petition_category');
	 		for (i=0; i<x.length; i++) {
	 			x[i].style.display='none';
	 		}	
	 		document.getElementsByClassName('petition-my-own')[0].style.display='block';
	 		self.style.color="#FFF";
	 		self.style.backgroundColor="#adacad";
	 		}
	 		//sub menu user end