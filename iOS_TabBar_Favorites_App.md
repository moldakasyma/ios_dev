# iOS Development Assignment: Favorites Manager App

## Overview
Build a UIKit-based iOS application that manages user favorites across four categories: Movies, Music, Books, and Courses. The app uses a tab-based interface with table views and detailed information screens.

---

## Requirements

### 1. Application Architecture

#### Tab Bar Structure
- Implement a `UITabBarController` with **4 tabs**
- Each tab represents a favorites category:
  1. **Movies** (🎬)
  2. **Music** (🎵)
  3. **Books** (📚)
  4. **Courses** (🎓)

#### View Controllers
- Each tab contains a dedicated `UIViewController`
- Each view controller embeds a `UITableView` displaying favorites in that category
- Minimum of **10 items** per category

---

### 2. Table View Requirements

#### Cell Design
Each `UITableViewCell` must display:
- **Image**: Thumbnail/icon representing the item (use placeholder images or SF Symbols)
- **Title**: Name of the favorite item

#### Cell Specifications
- Use custom `UITableViewCell` subclass or configure programmatically
- Image size: 60x60 points (recommended)
- Title should be clearly readable with appropriate font sizing
- Implement proper Auto Layout constraints for cell contents
- Cell height should accommodate content without clipping

#### Data Requirements
Populate each table view with at least **10 unique items**:

---

### 3. Detail View Requirements

#### Navigation
- Tapping any cell should push a detail view controller onto the navigation stack
- Use `UINavigationController` embedded in each tab

#### Detail Page Components
The detail view controller must display:

1. **Image**
   - Full-width or centered large image
   - Aspect ratio: 16:9 or 4:3

2. **Title**
   - Large, bold font (e.g., 28pt, bold)
   - Positioned below the image with proper spacing

3. **Description**
   - Multi-line text view with scrolling capability
   - Font size: 16-17pt
   - Should include relevant information about the item (plot, features, content overview)
   - Minimum 3-4 sentences

4. **Your Review**
   - Section header: "Your Review" or "My Thoughts"
   - Personal rating or review text
   - Could include star rating (optional enhancement)
   - Font size: 15-16pt

#### Layout Specifications
- Maintain consistent padding/margins (16-20pt from screen edges)
- Proper spacing between elements (12-16pt recommended)
- All constraints must be properly set with **no warnings or errors**

---

### 4. Technical Requirements

#### UIKit Components
- `UITabBarController`
- `UINavigationController` (embedded in each tab)
- `UIViewController` (custom subclasses)
- `UITableView` with `UITableViewDataSource` and `UITableViewDelegate`
- `UITableViewCell` (custom or configured)
- `UIImageView`
- `UILabel`

#### Constraints & Layout
- **All constraints must be valid** (no Auto Layout warnings or errors)
- Use programmatic Auto Layout or Interface Builder (Storyboards/XIBs)
- Ensure layout works on different iPhone screen sizes
- Test on at least iPhone SE and iPhone 15 Pro Max simulators

#### Code Organization
- Separate view controllers for each category
- Model objects to represent data (Movie, Song, Book, Course)
- Clean separation of concerns
- Proper naming conventions

---

### 5. Design Guidelines

#### Visual Polish
- Consistent color scheme throughout the app
- Appropriate use of system colors or custom theme
- Adequate spacing and padding
- Clean, professional appearance

#### Tab Bar Icons
- Use SF Symbols or custom icons
- Clearly represent each category
- Proper tint colors (selected/unselected states)

---

### 6. Bonus Features (Optional)

- Search bar in table views
- Ability to mark items as "watched/read/completed"
- Star rating system in detail view
- Swipe actions to delete or favorite items
- Empty state views when no items exist
- Custom transition animations

---

## Deliverables

1. **Xcode Project**
   - Complete iOS project folder
   - Minimum deployment target: iOS 15.0
   - Should build without errors or warnings

2. **Source Code**
   - Well-commented Swift code
   - Proper file organization
   - Clear variable and function names

3. **README**
   - Brief description of the app
   - How to run the project
   - Any special features implemented

---

## Evaluation Criteria

| Criterion | Points | Description |
|-----------|--------|-------------|
| Tab Bar Implementation | 15 | Properly configured with 4 tabs |
| Table Views | 20 | All 4 table views working with 10+ items each |
| Cell Design | 15 | Image + title displayed correctly |
| Detail View | 25 | All required components present and functional |
| Constraints | 15 | No Auto Layout errors, proper layouts on all screens |
| Code Quality | 5 | Clean, organized, well-commented |
| Design & Polish | 5 | Professional appearance, good UX |
| **Total** | **100** | |

---

## Getting Started

### Step 1: Project Setup
1. Create a new iOS App project in Xcode
2. Choose "Storyboard" for interface
3. Name it "FavoritesManager" or similar

### Step 2: Create Tab Bar
1. Add `UITabBarController` as the initial view controller
2. Create 4 view controllers (or use a base class for reusability)
3. Embed each in a `UINavigationController`

### Step 3: Implement Table Views
1. Add `UITableView` to each view controller
2. Create data models for your items
3. Implement `UITableViewDataSource` methods
4. Design custom cells with image and title

### Step 4: Create Detail View
1. Design detail view controller layout
2. Implement navigation on cell selection
3. Pass data from table view to detail view
4. Set up all constraints properly

### Step 5: Polish & Test
1. Add images and content
2. Test on multiple simulators
3. Verify all constraints
4. Check for memory leaks and crashes

---

## Resources

- [Apple Human Interface Guidelines](https://developer.apple.com/design/human-interface-guidelines/)
- [UIKit Documentation](https://developer.apple.com/documentation/uikit)
- [Auto Layout Guide](https://developer.apple.com/library/archive/documentation/UserExperience/Conceptual/AutolayoutPG/)
- [SF Symbols](https://developer.apple.com/sf-symbols/)

---

## Submission Guidelines

1. Upload your Xcode project to Git
2. Include a README.md file
3. Ensure the project builds successfully

---

## Academic Integrity

This is an individual assignment. While you may discuss concepts with classmates, all code must be your own work. Use of AI assistants should follow your institution's policies.

---

**Good luck and happy coding! 🚀**
