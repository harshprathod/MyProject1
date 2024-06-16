<div class="container">
    <nav class="navbar navbar-expand-lg navbar-dark custom-navbar">
        <a class="navbar-brand" href="index.jsp">Notes Tracker</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse justify-content-between" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="addnotes.jsp">Add Note</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="allnotes.jsp" tabindex="-1" aria-disabled="true">View Notes</a>
                </li>
            </ul>
            <form class="form-inline my-2 my-lg-0">
                <input class="form-control mr-sm-2 search-input" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-light my-2 my-sm-0 search-btn" type="submit">Search</button>
            </form>
        </div>
    </nav>
</div>

<style>
    .custom-navbar {
        background-color: #91DDCF; /* Main background color */
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }
    
    .navbar-brand {
        font-size: 1.5rem;
        font-weight: bold;
        color: #F7F9F2; /* Light text color */
    }
    
    .nav-link {
        font-size: 1.1rem;
        margin-right: 1rem;
        color: #F7F9F2; /* Light text color */
        transition: color 0.3s;
    }
    
    .nav-link:hover {
        color: #F19ED2; /* Highlight color */
    }
    
    .search-input {
        border-radius: 30px;
        padding: 0.5rem 1rem;
        border: 1px solid #E8C5E5; /* Border color */
    }
    
    .search-btn {
        border-radius: 30px;
        padding: 0.5rem 1rem;
        background-color: #F19ED2; /* Button background color */
        border: none;
        color: #F7F9F2; /* Button text color */
    }

    .search-btn:hover {
        background-color: #E8C5E5; /* Button hover background color */
    }

    @media (max-width: 992px) {
        .navbar-brand {
            font-size: 1.2rem;
        }

        .nav-link {
            font-size: 1rem;
            margin-right: 0.5rem;
        }

        .search-input, .search-btn {
            padding: 0.3rem 0.8rem;
        }
    }

    @media (max-width: 768px) {
        .navbar-brand {
            font-size: 1rem;
        }

        .nav-link {
            font-size: 0.9rem;
            margin-right: 0.3rem;
        }

        .search-input, .search-btn {
            padding: 0.2rem 0.6rem;
        }
    }
</style>
