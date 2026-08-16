window.addEventListener("load",function(){
  const loader=document.getElementById("loader");
  if(loader) loader.style.display="none";
});

const themeButton=document.getElementById("themeButton");
if(themeButton){
  themeButton.onclick=function(){
    document.body.classList.toggle("dark-mode");
    themeButton.textContent=document.body.classList.contains("dark-mode")?"Light Mode":"Dark Mode";
  };
}

const menuButton=document.getElementById("menuButton");
const navLinks=document.getElementById("navLinks");
if(menuButton&&navLinks){
  menuButton.onclick=function(){
    navLinks.style.display=navLinks.style.display==="block"?"none":"block";
  };
  navLinks.querySelectorAll("a").forEach(function(link){
    link.onclick=function(){navLinks.style.display="none";};
  });
}

const topButton=document.getElementById("topButton");
if(topButton){
  window.addEventListener("scroll",function(){
    topButton.style.display=window.scrollY>300?"block":"none";
  });
  topButton.onclick=function(){
    window.scrollTo({top:0,behavior:"smooth"});
  };
}

const contactButton=document.getElementById("contactButton");
if(contactButton){
  contactButton.onclick=function(){
    const contact=document.getElementById("contact");
    if(contact) contact.scrollIntoView({behavior:"smooth"});
  };
}

const contactForm=document.getElementById("contactForm");
const response=document.getElementById("response");
if(contactForm){
  contactForm.onsubmit=function(event){
    event.preventDefault();
    const name=document.getElementById("name").value.trim();
    const email=document.getElementById("email").value.trim();
    const message=document.getElementById("message").value.trim();
    if(!name||!email||!message){
      response.textContent="Please complete all fields.";
      return;
    }
    response.textContent="Thank you, "+name+"! Your message has been received.";
    contactForm.reset();
  };
}

function viewProject(projectName){
  const details=document.getElementById("projectDetails");
  if(!details)return;
  const descriptions={
    "Sales Dashboard":"An Excel-based dashboard designed to analyze sales performance, revenue and key business metrics.",
    "SQL Data Analysis":"A SQL project for analyzing customer and sales data.",
    "Power BI Dashboard":"An interactive Power BI dashboard for turning raw data into useful insights.",
    "Project Management":"A project management project demonstrating planning, organization, coordination and project tracking. Certification: Certificate in Project Management."
  };
  details.innerHTML="<h2>"+projectName+"</h2><p>"+descriptions[projectName]+"</p><button onclick='closeProjectDetails()'>Close</button>";
  details.scrollIntoView({behavior:"smooth",block:"center"});
}

function closeProjectDetails(){
  const details=document.getElementById("projectDetails");
  if(details) details.innerHTML="";
}
