public class Review {
    private int id;
    private User reviewer;
    private int score;
    private String justification;

    // Constructors
    public Review() {
        // Default constructor
    }

    public Review(int id, User reviewer, int score, String justification) {
        this.id = id;
        this.reviewer = reviewer;
        this.score = score;
        this.justification = justification;
    }
}