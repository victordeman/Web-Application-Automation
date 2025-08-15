#!/bin/bash

# Ensure PROJECT_ROOT is set, default to current directory if not provided
PROJECT_ROOT=${PROJECT_ROOT:-$(pwd)}

# Create README.md
cat << EOT > "$PROJECT_ROOT/README.md"
# Multilingual Onboarding Quiz App

This project is an interactive, multilingual onboarding quiz application designed for frontline workers, emphasizing accessibility and user engagement. It features a React-based frontend, a Node.js backend, and a Streamlit dashboard, with TypeScript for type safety and Jest for testing. The application supports dynamic language switching, timed quizzes, certificate generation, and responsive design, making it suitable for diverse user groups.

**Repository**: [https://github.com/victordeman/Multilingual-Onboarding-Quiz-App](https://github.com/victordeman/Multilingual-Onboarding-Quiz-App)

## Features
- **Multilingual Interface**: Supports English and German with dynamic language switching using i18next.
- **Timed Quizzes**: Questions with a 30-second timer and immediate feedback on answers.
- **Certificate Generation**: Downloadable PDF certificates upon quiz completion using jsPDF.
- **Responsive Design**: Optimized for mobile and desktop devices using Tailwind CSS.
- **Streamlit Dashboard**: Alternative interface for viewing and submitting quizzes.
- **Accessibility**: ARIA attributes, keyboard navigation, and high-contrast visuals for inclusivity.

## Tech Stack
- **Frontend**: React (18.2.0), TypeScript (4.9.5), Tailwind CSS (3.3.0), i18next (23.5.1), jsPDF (2.5.1)
- **Backend**: Node.js (18.16.0), Express (4.18.2), TypeScript (4.9.5)
- **Streamlit Dashboard**: Python (3.10.14), Streamlit (1.22.0)
- **Testing**: Jest (29.5.0), React Testing Library (14.0.0)
- **Design**: Figma for prototyping (not included in repository)
- **Dependencies**: Listed in \`frontend/package.json\`, \`backend/package.json\`, and \`streamlit/requirements.txt\`

## Project Structure
\`\`\`
Multilingual-Onboarding-Quiz-App/
├── frontend/                # React frontend
│   ├── public/             # Static assets
│   │   └── index.html      # HTML entry point
│   ├── src/
│   │   ├── components/     # Reusable components (Quiz, Certificate)
│   │   ├── i18n.ts         # i18next configuration for multilingual support
│   │   ├── App.tsx         # Main React application
│   │   ├── index.tsx       # React entry point
│   │   └── index.css       # Global styles
│   ├── package.json        # Frontend dependencies
│   └── tsconfig.json       # TypeScript configuration
├── backend/                # Node.js backend
│   ├── server.ts           # Express server with API endpoints
│   ├── package.json        # Backend dependencies
│   └── tsconfig.json       # TypeScript configuration
├── streamlit/              # Streamlit dashboard
│   ├── app.py              # Streamlit application for quiz dashboard
│   └── requirements.txt    # Python dependencies for Streamlit
├── tests/                  # Jest tests
│   └── Quiz.test.tsx       # Unit tests for quiz components
├── docs/                   # Placeholder for documentation (e.g., Figma prototype)
├── .gitignore              # Ignores node_modules, build artifacts, and temp files
└── README.md               # Project documentation and setup instructions
\`\`\`

## Prerequisites
Before setting up the project, ensure you have the following installed:
- **Node.js (18.16.0)**: For running the frontend and backend.
- **Python (3.10.14)**: For the Streamlit dashboard, managed via \`pyenv\` (recommended).
- **Git**: For cloning the repository and version control.
- **npm**: For managing JavaScript dependencies.
- **pip**: For installing Python dependencies.
- **curl**: For testing API endpoints.
- **pyenv**: For managing Python versions (optional but recommended).

## Setup Instructions
Follow these steps to set up and run the project locally:

1. **Clone the Repository**:
   Clone the project from GitHub and navigate to the project directory:
   \`\`\`bash
   git clone https://github.com/victordeman/Multilingual-Onboarding-Quiz-App.git
   cd Multilingual-Onboarding-Quiz-App
   \`\`\`

2. **Frontend Setup**:
   Navigate to the frontend directory, install dependencies, and start the React app:
   \`\`\`bash
   cd frontend
   npm install
   npm start
   \`\`\`
   The frontend will be available at \`http://localhost:3000\`.

3. **Backend Setup**:
   Navigate to the backend directory, install dependencies, and start the Express server:
   \`\`\`bash
   cd ../backend
   npm install
   npm start
   \`\`\`
   The backend API will be available at \`http://localhost:5000\`. Test the API:
   \`\`\`bash
   curl http://localhost:5000/health
   \`\`\`
   Expected response: \`{"status": "healthy"}\`.

4. **Streamlit Dashboard Setup**:
   Navigate to the Streamlit directory, set up a Python environment, and run the dashboard:
   \`\`\`bash
   cd ../streamlit
   pyenv install 3.10.14
   pyenv local 3.10.14
   python -m venv venv
   source venv/bin/activate
   pip install -r requirements.txt
   streamlit run app.py
   \`\`\`
   The dashboard will be available at \`http://localhost:8501\`.

5. **Run Unit Tests**:
   Navigate to the frontend directory and run Jest tests:
   \`\`\`bash
   cd ../frontend
   npm test
   \`\`\`
   This runs tests in \`tests/Quiz.test.tsx\` covering quiz functionality, language switching, and certificate generation.

## Usage
- **React Frontend**:
   - Access the quiz at \`http://localhost:3000\`.
   - Select a language (English or German) from the dropdown.
   - Answer timed questions (30 seconds each) and receive immediate feedback.
   - Download a PDF certificate upon quiz completion.
- **Streamlit Dashboard**:
   - Access the dashboard at \`http://localhost:8501\`.
   - View quiz questions, submit answers, and track progress.
- **API Endpoints**:
   - **GET /health**: Check server status (\`{"status": "healthy"}\`).
   - **GET /quiz**: Retrieve quiz questions.
   - **POST /quiz/submit**: Submit quiz answers (e.g., \`{"answers": [1, 2, 3]}\`).

## Accessibility
- **ARIA Labels**: Components include ARIA attributes for screen reader compatibility.
- **Keyboard Navigation**: Full support for keyboard-only navigation.
- **High-Contrast Visuals**: Tailwind CSS ensures readable, high-contrast design.

## Challenges and Solutions
- **Multilingual Support**: Implemented i18next for dynamic language switching, resolving issues with real-time translation updates.
- **Certificate Generation**: Fixed jsPDF rendering issues by adjusting font sizes and canvas dimensions for consistent PDF output.
- **Testing Coverage**: Added Jest tests for edge cases (e.g., timer expiration, invalid inputs) to ensure robust quiz functionality.
- **Responsive Design**: Used Tailwind CSS to address layout issues on mobile devices, ensuring consistent UX.
- **Streamlit Integration**: Resolved Python version conflicts by specifying 3.10.14 in \`.python-version\` and using \`pyenv\`.

## Notes
- **Persistence**: The current backend uses in-memory storage for quiz data. For production, consider integrating a database like MongoDB or PostgreSQL.
- **Authentication**: Future iterations could include user authentication (e.g., Firebase) for personalized quiz tracking.
- **Scalability**: The single-instance backend is sufficient for local use. For production, deploy with Docker and Kubernetes for scalability.
- **Testing**: Expand test coverage to include backend API endpoints and Streamlit components.
- **Troubleshooting**: Check console logs in the browser for frontend issues or use \`node --inspect\` for backend debugging.

## Future Improvements
- Add user authentication (e.g., Firebase) for personalized quiz experiences.
- Integrate a database (e.g., MongoDB) for persistent quiz and response storage.
- Expand language support to include Spanish, French, etc.
- Enhance Streamlit dashboard with advanced analytics and visualizations.

## Portfolio Value
This project showcases:
- Proficiency in building full-stack applications with React, TypeScript, and Node.js.
- Expertise in creating accessible, multilingual interfaces for diverse users.
- Integration of multiple UIs (React and Streamlit) with a shared backend.
- Focus on user-centric design tailored for frontline workers.

For issues or contributions, open a GitHub issue or contact the repository owner.
EOT

# Verify README.md was created
if [ -f "$PROJECT_ROOT/README.md" ]; then
    echo "README.md generated in $PROJECT_ROOT"
    echo "File created/updated:"
    ls -l "$PROJECT_ROOT/README.md"
    echo "Next steps: Verify README.md, then run 'git add README.md', 'git commit', and 'git push' manually."
else
    echo "Error: Failed to create README.md in $PROJECT_ROOT"
    exit 1
fi
