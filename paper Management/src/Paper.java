import java.time.LocalDateTime;
import java.util.List;

public class Paper {
    private int id;
    private String title;
    private String abstractText;
    private String content; // PDF or TEX file
    private List<String> authors;
    private List<User> coAuthors;
    private List<Review> reviews;
    private PaperState state;
    private LocalDateTime creationDate;


    public Paper() {
        // Default constructor
    }

    public Paper(int id, String title, String abstractText, String content, List<String> authors,
                 List<User> coAuthors, List<Review> reviews, PaperState state, LocalDateTime creationDate) {
        this.id = id;
        this.title = title;
        this.abstractText = abstractText;
        this.content = content;
        this.authors = authors;
        this.coAuthors = coAuthors;
        this.reviews = reviews;
        this.state = state;
        this.creationDate = creationDate;
    }
    //get
    public String getTitle() {
        return title;
    }

    public String getAbstractText() {
        return abstractText;
    }

    public String getContent() {
        return content;
    }

    public List<String> getAuthors() {
        return authors;
    }

    public List<User> getCoAuthors() {
        return coAuthors;
    }

    public List<Review> getReviews() {
        return reviews;
    }

    public PaperState getState() {
        return state;
    }

    public LocalDateTime getCreationDate() {
        return creationDate;
    }


    //set
    public void setId(int id) {
        this.id = id;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setAbstractText(String abstractText) {
        this.abstractText = abstractText;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public void setAuthors(List<String> authors) {
        this.authors = authors;
    }

    public void setCoAuthors(List<User> coAuthors) {
        this.coAuthors = coAuthors;
    }

    public void setReviews(List<Review> reviews) {
        this.reviews = reviews;
    }

    public void setState(PaperState state) {
        this.state = state;
    }

    public void setCreationDate(LocalDateTime creationDate) {
        this.creationDate = creationDate;
    }

}
