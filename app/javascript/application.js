// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
// Import Turbo


document.addEventListener('DOMContentLoaded', function() {
    const createTaskButton = document.querySelector('.create-button');
    
    if (createTaskButton) {
        createTaskButton.addEventListener('click', function(event) {
            event.preventDefault();
            Turbo.visit(event.target.href); // Use Turbo to visit the new task path
        });
    }
});
