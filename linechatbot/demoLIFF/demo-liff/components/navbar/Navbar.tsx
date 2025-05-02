const Navbar = () => {
    return (
        <nav>
            <div className="container flex justify-between py-8 px-4 mx-auto md:flex-row md:items-center md:justify-between">
                <p>Logo</p>
                <div className="flex items-center gap-4">
                    <p>darkmode</p>
                    <p>dropdownListmenu</p>
                </div>
            </div>
        </nav>
    )
}
export default Navbar