package filter;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class AuthFilter implements Filter {
    private FilterConfig filterConfig = null;
    public AuthFilter() {
    }
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {
      try {

            // check whether session variable is set
            HttpServletRequest req = (HttpServletRequest) request;
            HttpServletResponse res = (HttpServletResponse) response;
            HttpSession ses = req.getSession(false);
            if ( req.getRequestURI().indexOf("/users") >= 0) {
               if ( ses != null && ses.getAttribute("userid") != null) // OK. User Logged in so allow this
                   chain.doFilter(request, response);
               else  // user didn't log in but asking for a page in USERS folder, so take user to login page
                    res.sendRedirect(req.getContextPath() + "/faces/login.jsp");  // Anonymous user. Redirect to login page
            }
            else  // user is asking for non-sensitive page
                chain.doFilter(request, response);
      }
     catch(Throwable t) {
         System.out.println( t.getMessage());
     }
    }

    public FilterConfig getFilterConfig() {
        return (this.filterConfig);
    }
    public void setFilterConfig(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
    }
    public void destroy() {
    }
    public void init(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
    }
}
