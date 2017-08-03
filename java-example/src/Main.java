import edu.stanford.nlp.ling.Word;
import edu.stanford.nlp.parser.lexparser.LexicalizedParser;
import edu.stanford.nlp.process.PTBTokenizer;
import edu.stanford.nlp.trees.Tree;

import java.io.StringReader;
import java.util.List;

public class Main {

    public static void main(String[] args) {
        StringReader sr = new StringReader("Who should I give it to?");
        PTBTokenizer<Word> tokenizer = PTBTokenizer.newPTBTokenizer(sr);
        List<Word> tokens = tokenizer.tokenize();
        System.out.println("TOKENS: " + tokens);
        LexicalizedParser parser = LexicalizedParser.loadModel();
        Tree tree = parser.apply(tokens);
        System.out.println("TREE: " + tree);
    }
}

