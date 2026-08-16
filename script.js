// ==============================
// PORTFOLIO JAVASCRIPT
// ==============================

document.addEventListener("DOMContentLoaded", function () {

  // ==============================
  // LOADING SCREEN
  // ==============================

  const loader = document.getElementById("loader");

  if (loader) {
    loader.style.display = "none";
  }


  // ==============================
  // DARK MODE
  // ==============================

  const themeButton = document.getElementById("themeButton");

  if (themeButton) {

    themeButton.addEventListener("click", function () {

      document.body.classList.toggle("dark-mode");

      if (document.body.classList.contains("dark-mode")) {
        themeButton.textContent = "Light Mode";
      } else {
        themeButton.textContent = "Dark Mode";
      }

    });

  }


  // ==============================
  // MOBILE MENU
  // ==============================

  const menuButton = document.getElementById("menuButton");
  const navLinks = document.getElementById("navLinks");

  if (menuButton && navLinks) {

    menuButton.addEventListener("click", function () {

      if (navLinks.style.display === "block") {
        navLinks.style.display = "none";
      } else {
        navLinks.style.display = "block";
      }

    });


    // Close menu after clicking a link

    const links = navLinks.querySelectorAll("a");

    links.forEach(function (link) {

      link.addEventListener("click", function () {
        navLinks.style.display = "none";
      });

    });

  }


  // ==============================
  // CONTACT ME BUTTON
  // ==============================

  const contactButton = document.getElementById("contactButton");

  if (contactButton) {

    contactButton.addEventListener("click", function () {

      const contactSection = document.getElementById("contact");

      if (contactSection) {

        contactSection.scrollIntoView({
          behavior: "smooth"
        });

      }

    });

  }


  // ==============================
  // TOP BUTTON
  // ==============================

  const topButton = document.getElementById("topButton");

  if (topButton) {

    window.addEventListener("scroll", function () {

      if (window.scrollY > 300) {
        topButton.style.display = "block";
      } else {
        topButton.style.display = "none";
      }

    });


    topButton.addEventListener("click", function () {

      window.scrollTo({
        top: 0,
        behavior: "smooth"
      });

    });

  }


  // ==============================
  // CONTACT FORM
  // ==============================

  const contactForm = document.getElementById("contactForm");
  const response = document.getElementById("response");

  if (contactForm && response) {

    contactForm.addEventListener("submit", function (event) {

      event.preventDefault();

      const name =
        document.getElementById("name").value.trim();

      const email =
        document.getElementById("email").value.trim();

      const message =
        document.getElementById("message").value.trim();


      if (
        name === "" ||
        email === "" ||
        message === ""
      ) {

        response.textContent =
          "Please complete all fields.";

        return;

      }


      response.textContent =
        "Thank you, " +
        name +
        "! Your message has been received.";


      contactForm.reset();

    });

  }

});


// ==============================
// PROJECT DETAILS
// ==============================

function viewProject(projectName) {

  const details =
    document.getElementById("projectDetails");

  if (!details) {
    return;
  }


  if (projectName === "Sales Dashboard") {

    details.innerHTML = `
      <h2>Sales Dashboard</h2>

      <p>
        An Excel-based dashboard designed to analyze
        sales performance, revenue and key business
        metrics.
      </p>

      <p>
        <strong>Tool:</strong> Microsoft Excel
      </p>

      <button onclick="closeProjectDetails()">
        Close
      </button>
    `;

  }


  else if (projectName === "SQL Data Analysis") {

    details.innerHTML = `
      <h2>SQL Data Analysis</h2>

      <p>
        A SQL project for analyzing customer,
        sales and business data.
      </p>

      <p>
        <strong>Tool:</strong> SQL
      </p>

      <button onclick="closeProjectDetails()">
        Close
      </button>
    `;

  }


  else if (projectName === "Power BI Dashboard") {

    details.innerHTML = `
      <h2>Power BI Dashboard</h2>

      <p>
        An interactive Power BI dashboard that
        transforms raw data into useful business
        insights.
      </p>

      <p>
        <strong>Tool:</strong> Power BI
      </p>

      <button onclick="closeProjectDetails()">
        Close
      </button>
    `;

  }


  else if (projectName === "Project Management") {

    details.innerHTML = `
      <h2>Project Management</h2>

      <p>
        A project management project demonstrating
        planning, organization, coordination,
        documentation and project tracking.
      </p>

      <p>
        <strong>Certification:</strong>
        Certificate in Project Management
      </p>

      <button onclick="closeProjectDetails()">
        Close
      </button>
    `;

  }


  details.scrollIntoView({
    behavior: "smooth",
    block: "center"
  });

}


// ==============================
// CLOSE PROJECT DETAILS
// ==============================

function closeProjectDetails() {

  const details =
    document.getElementById("projectDetails");

  if (details) {
    details.innerHTML = "";
  }

}
