== Vorbereitung

* Mache die folgenden Abschnitte von http://guides.rubyonrails.org/index.html offline verfügbar:
    * Models
    * Views
    * Controllers
    * Digg Deeper
        * Active Support Core Extensions
        * Rails Internationalization API
        * Active Job Basics
        * Securing Rails Applications
        * Debugging Rails Applications
        * Configuring Rails Applications
        * Rails Command Line Tools and Rake Tasks
        * Asset Pipeline
        * Working with JavaScript in Rails
    * Testing (http://guides.rubyonrails.org/testing.html)
* Diese Themen sollten präsent sein:
    * CSS-Selektoren
    * Scopes
    * Scaffolding
    * Sessions

* Generiere die folgenden Modelle (Option -s verwenden!):
    * Article
        * title - string
        * teaser - string
        * content - text
        * publish_at - datetime
        * publish_until - datetime
        * Wird verfasst von einem Author
        * Hat viele Kategorien
    * Author
        * username - string
        * email - string
        * Hat viele Artikel
    * Categorie
        * name - string
        * Hat viele Artikel